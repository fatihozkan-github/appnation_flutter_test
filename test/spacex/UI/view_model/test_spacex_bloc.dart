import 'package:appnation_flutter_test/spacex/UI/view_model/spacex_bloc.dart';
import 'package:appnation_flutter_test/spacex/model/spacex_model.dart';
import 'package:appnation_flutter_test/spacex/service/spacex_service.dart';
import 'package:appnation_flutter_test/spacex/utils/constants.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SpaceXBloc spaceXBloc;
  late SpaceXService spaceXService;
  late Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: Constants.lastFlightEndPoint));
    spaceXService = SpaceXService(dio);
    spaceXBloc = SpaceXBloc(spaceXService: spaceXService);
  });

  tearDown(() async {
    await spaceXBloc.close();
  });

  group('should satisfy SpaceXBloc Tests', () {
    blocTest<SpaceXBloc, SpaceXState>(
      'should build spaceXBloc',
      build: () => spaceXBloc,
    );

    test('should emit initial state', () async* {
      await expectLater(spaceXBloc.state, emits(SpaceXInitialState()));
    });

    blocTest<SpaceXBloc, SpaceXState>(
      'should expect nothing',
      build: () => spaceXBloc,
      act: (bloc) => bloc,
      expect: () => [],
    );

    blocTest<SpaceXBloc, SpaceXState>(
      'should emit SpaceXInitialState',
      wait: Duration.zero,
      build: () => spaceXBloc,
      act: (bloc) => bloc.emit(SpaceXInitialState()),
      expect: () => [
        SpaceXInitialState(),
      ],
    );

    blocTest<SpaceXBloc, SpaceXState>(
      'should emit SpaceXLoadingState',
      wait: Duration.zero,
      build: () => spaceXBloc,
      act: (bloc) => bloc.emit(SpaceXLoadingState(false)),
      expect: () => [
        SpaceXLoadingState(false),
      ],
    );

    blocTest<SpaceXBloc, SpaceXState>(
      'should emit SpaceXLoadingState',
      wait: Duration.zero,
      build: () => spaceXBloc,
      act: (bloc) => bloc.emit(SpaceXLoadingState(true)),
      expect: () => [
        SpaceXLoadingState(true),
      ],
    );

    blocTest<SpaceXBloc, SpaceXState>(
      'should emit SpaceXCompletedState',
      wait: Duration.zero,
      build: () => spaceXBloc,
      act: (bloc) => bloc.emit(SpaceXCompletedState(SpaceXModel())),
      expect: () => [
        SpaceXCompletedState(SpaceXModel()),
      ],
    );

    blocTest<SpaceXBloc, SpaceXState>(
      'should emit all states',
      wait: Duration.zero,
      build: () => spaceXBloc,
      act: (bloc) => [
        bloc.emit(SpaceXInitialState()),
        bloc.emit(SpaceXLoadingState(true)),
        bloc.emit(SpaceXLoadingState(false)),
        bloc.emit(SpaceXCompletedState(SpaceXModel())),
      ],
      expect: () => [
        SpaceXInitialState(),
        SpaceXLoadingState(false),
        SpaceXCompletedState(SpaceXModel()),
      ],
    );
  });
}
