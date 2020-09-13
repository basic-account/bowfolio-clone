import 'package:equatable/equatable.dart';

import '../../models/profile.dart';

abstract class ProfilesState extends Equatable {}

class InitialState extends ProfilesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ProfilesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ProfilesState {
  LoadedState(this.profiles);

  final List<Profile> profiles;

  @override
  List<Object> get props => [profiles];
}

class ErrorState extends ProfilesState {
  @override
  List<Object> get props => [];
}