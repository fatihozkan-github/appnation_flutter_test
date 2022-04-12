part of 'spacex_bloc.dart';

abstract class SpaceXEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLastFlight extends SpaceXEvent {}
