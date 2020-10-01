import 'package:equatable/equatable.dart';

import '../../models/interest.dart';

abstract class InterestsState extends Equatable {}

class InitialState extends InterestsState {
  @override
  List<Object> get props => [];
}

class InterestsLoadingState extends InterestsState {
  @override
  List<Object> get props => [];
}

class InterestsLoadedState extends InterestsState {
  final List<Interest> interests;
  
  InterestsLoadedState(this.interests);

  @override
  List<Object> get props => [interests];
}

class InterestsErrorState extends InterestsState {
  @override
  List<Object> get props => [];
}