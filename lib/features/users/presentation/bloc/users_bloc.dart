import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/helpers/failure_mapper_helper.dart';
import '../../../logging/domain/usecases/logging.dart';
import '../../domain/entities/user_table.dart';
import '../../domain/usercases/get_users_table.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersTable getUsersTable;
  final Logging logging;

  UsersBloc({
    @required this.getUsersTable,
    @required this.logging,
  }) : super(UsersInitial());

  @override
  Stream<Transition<UsersEvent, UsersState>> transformEvents(
    Stream<UsersEvent> events,
    transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    final currentState = state;

    if (event is UsersFetch && !_hasReachedMax(currentState)) {
      if (currentState is UsersInitial) {
        yield* _fetchInitial(
          tautulliId: event.tautulliId,
          grouping: event.grouping,
          orderColumn: event.orderColumn,
          orderDir: event.orderDir,
          start: event.start,
          length: event.length,
          search: event.search,
        );
      }
      if (currentState is UsersSuccess) {
        yield* _fetchMore(
          currentState: currentState,
          tautulliId: event.tautulliId,
          grouping: event.grouping,
          orderColumn: event.orderColumn,
          orderDir: event.orderDir,
          start: event.start,
          length: event.length,
          search: event.search,
        );
      }
    }
    if (event is UsersFilter) {
      yield UsersInitial();
      yield* _fetchInitial(
        tautulliId: event.tautulliId,
        grouping: event.grouping,
        orderColumn: event.orderColumn,
        orderDir: event.orderDir,
        start: event.start,
        length: event.length,
        search: event.search,
      );
    }
  }

  Stream<UsersState> _fetchInitial({
    @required String tautulliId,
    int grouping,
    String orderColumn,
    String orderDir,
    int start,
    int length,
    String search,
  }) async* {
    final usersListOrFailure = await getUsersTable(
      tautulliId: tautulliId,
      grouping: grouping,
      orderColumn: orderColumn,
      orderDir: orderDir,
      start: start,
      length: length ?? 25,
      search: search,
    );

    yield* usersListOrFailure.fold(
      (failure) async* {
        yield UsersFailure(
          failure: failure,
          message: FailureMapperHelper().mapFailureToMessage(failure),
          suggestion: FailureMapperHelper().mapFailureToSuggestion(failure),
        );
      },
      (list) async* {
        yield UsersSuccess(
          list: list,
          hasReachedMax: list.length < 25,
        );
      },
    );
  }

  Stream<UsersState> _fetchMore({
    @required UsersSuccess currentState,
    @required String tautulliId,
    int grouping,
    String orderColumn,
    String orderDir,
    int start,
    int length,
    String search,
  }) async* {
    final usersListOrFailure = await getUsersTable(
      tautulliId: tautulliId,
      grouping: grouping,
      orderColumn: orderColumn,
      orderDir: orderDir,
      start: currentState.list.length,
      length: length ?? 25,
      search: search,
    );

    yield* usersListOrFailure.fold(
      (failure) async* {
        yield UsersFailure(
          failure: failure,
          message: FailureMapperHelper().mapFailureToMessage(failure),
          suggestion: FailureMapperHelper().mapFailureToSuggestion(failure),
        );
      },
      (list) async* {
        if (list.isEmpty) {
          yield currentState.copyWith(hasReachedMax: true);
        } else {
          yield UsersSuccess(
            list: currentState.list + list,
            hasReachedMax: list.length < 25,
          );
        }
      },
    );
  }

  bool _hasReachedMax(UsersState state) =>
      state is UsersSuccess && state.hasReachedMax;
}
