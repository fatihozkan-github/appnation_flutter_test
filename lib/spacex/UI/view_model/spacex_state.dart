part of 'spacex_bloc.dart';

abstract class SpaceXState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SpaceXInitialState extends SpaceXState {}

class SpaceXLoadingState extends SpaceXState {
  final bool isLoading;

  SpaceXLoadingState(this.isLoading);
}

class SpaceXCompletedState extends SpaceXState {
  final SpaceXModel spaceXData;

  SpaceXCompletedState(this.spaceXData);
}

class SpaceXErrorState extends SpaceXState {
  final String? errorMessage;

  SpaceXErrorState(this.errorMessage);
}
