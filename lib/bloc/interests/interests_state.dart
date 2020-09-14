import 'package:equatable/equatable.dart';

import '../../models/interest.dart';

abstract class InterestsState extends Equatable {}

class InitialState extends InterestsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends InterestsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends InterestsState {
  final List<Interest> interests;
  
  LoadedState(this.interests);

  @override
  List<Object> get props => [interests];
}

class ErrorState extends InterestsState {
  @override
  List<Object> get props => [];
}