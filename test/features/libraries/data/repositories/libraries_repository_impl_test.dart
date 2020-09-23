import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tautulli_remote_tdd/core/error/failure.dart';
import 'package:tautulli_remote_tdd/core/helpers/failure_mapper_helper.dart';
import 'package:tautulli_remote_tdd/core/network/network_info.dart';
import 'package:tautulli_remote_tdd/features/libraries/data/datasources/libraries_data_source.dart';
import 'package:tautulli_remote_tdd/features/libraries/data/models/library_model.dart';
import 'package:tautulli_remote_tdd/features/libraries/data/repositories/libraries_repository_impl.dart';
import 'package:tautulli_remote_tdd/features/libraries/domain/entities/library.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockLibrariesDataSource extends Mock implements LibrariesDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFailureMapperHelper extends Mock implements FailureMapperHelper {}

void main() {
  LibrariesRepositoryImpl repository;
  MockLibrariesDataSource mockLibrariesDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockFailureMapperHelper mockFailureMapperHelper;

  setUp(() {
    mockLibrariesDataSource = MockLibrariesDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockFailureMapperHelper = MockFailureMapperHelper();
    repository = LibrariesRepositoryImpl(
      dataSource: mockLibrariesDataSource,
      networkInfo: mockNetworkInfo,
      failureMapperHelper: mockFailureMapperHelper,
    );
  });

  final String tTautulliId = 'jkl';

  final List<Library> tLibrariesList = [];

  final librariesJson = json.decode(fixture('libraries.json'));

  librariesJson['response']['data']['data'].forEach((item) {
    tLibrariesList.add(LibraryModel.fromJson(item));
  });

  test(
    'should check if device is online',
    () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getLibrariesTable(tautulliId: tTautulliId);
      // assert
      verify(mockNetworkInfo.isConnected);
    },
  );

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      'should call the data source getLibrariesTable()',
      () async {
        // act
        await repository.getLibrariesTable(tautulliId: tTautulliId);
        // assert
        verify(
          mockLibrariesDataSource.getLibrariesTable(tautulliId: tTautulliId),
        );
      },
    );

    test(
      'should return list of Library when call to API is successful',
      () async {
        // arrange
        when(
          mockLibrariesDataSource.getLibrariesTable(
            tautulliId: tTautulliId,
          ),
        ).thenAnswer((_) async => tLibrariesList);
        // act
        final result = await repository.getLibrariesTable(tautulliId: tTautulliId);
        // assert
        expect(result, equals(Right(tLibrariesList)));
      },
    );
  });

  group('device is offline', () {
    test(
      'should return a ConnectionFailure when there is no network connection',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await repository.getLibrariesTable(tautulliId: tTautulliId);
        // assert
        expect(result, equals(Left(ConnectionFailure())));
      },
    );
  });
}
