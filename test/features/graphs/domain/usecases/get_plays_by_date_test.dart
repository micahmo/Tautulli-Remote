import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tautulli_remote/features/graphs/data/models/graph_data_model.dart';
import 'package:tautulli_remote/features/graphs/data/models/series_data_model.dart';
import 'package:tautulli_remote/features/graphs/domain/entities/graph_data.dart';
import 'package:tautulli_remote/features/graphs/domain/entities/series_data.dart';
import 'package:tautulli_remote/features/graphs/domain/repositories/graphs_repository.dart';
import 'package:tautulli_remote/features/graphs/domain/usecases/get_plays_by_date.dart';
import 'package:tautulli_remote/features/logging/domain/usecases/logging.dart';
import 'package:tautulli_remote/features/settings/domain/usecases/settings.dart';
import 'package:tautulli_remote/features/settings/presentation/bloc/settings_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockGraphsRepository extends Mock implements GraphsRepository {}

class MockSettings extends Mock implements Settings {}

class MockLogging extends Mock implements Logging {}

void main() {
  GetPlaysByDate usecase;
  MockGraphsRepository mockGraphsRepository;
  MockSettings mockSettings;
  MockLogging mockLogging;
  SettingsBloc settingsBloc;

  setUp(() {
    mockGraphsRepository = MockGraphsRepository();
    usecase = GetPlaysByDate(
      repository: mockGraphsRepository,
    );
    mockSettings = MockSettings();
    mockLogging = MockLogging();
    settingsBloc = SettingsBloc(
      settings: mockSettings,
      logging: mockLogging,
    );
  });

  const String tTautulliId = 'jkl';

  final playsByDateJson = json.decode(fixture('graphs_play_by_date.json'));

  final List<String> tCategories = List<String>.from(
    playsByDateJson['response']['data']['categories'],
  );
  final List<SeriesData> tSeriesDataList = [];

  playsByDateJson['response']['data']['series'].forEach((item) {
    tSeriesDataList.add(SeriesDataModel.fromJson(item));
  });

  final tPlaysByDateGraphData = GraphDataModel(
    graphType: GraphType.playsByDate,
    categories: tCategories,
    graphData: tSeriesDataList,
  );

  test(
    'should get GraphData from repository',
    () async {
      // arrange
      when(
        mockGraphsRepository.getPlaysByDate(
          tautulliId: anyNamed('tautulliId'),
          timeRange: anyNamed('timeRange'),
          yAxis: anyNamed('yAxis'),
          userId: anyNamed('userId'),
          grouping: anyNamed('grouping'),
          settingsBloc: anyNamed('settingsBloc'),
        ),
      ).thenAnswer((_) async => Right(tPlaysByDateGraphData));
      // act
      final result = await usecase(
        tautulliId: tTautulliId,
        settingsBloc: settingsBloc,
      );
      // assert
      expect(result, equals(Right(tPlaysByDateGraphData)));
    },
  );
}
