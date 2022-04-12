import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/constants.dart';
import '../../model/spacex_model.dart';
import '../../service/ISpaceXService.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  SpaceXBloc({required this.spaceXService}) : super(SpaceXInitialState()) {
    on<GetLastFlight>((event, emit) async {
      try {
        changeLoadingState();
        final _data = await spaceXService.getLastFlight();
        changeLoadingState();

        if (_data is SpaceXModel) {
          emit(SpaceXCompletedState(_data));
        } else {
          emit(SpaceXErrorState(Constants.generalErrorText));
        }
      } catch (e) {
        emit(SpaceXErrorState(Constants.generalErrorText));
      }
    });
  }

  final ISpaceXService spaceXService;

  bool _isLoading = false;

  void changeLoadingState() => _isLoading = !_isLoading;
}
