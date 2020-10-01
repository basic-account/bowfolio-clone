import 'package:bowfolio/bloc/profiles/profiles.dart';
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
  final List<Profile> profiles;

  LoadedState(this.profiles);

  @override
  List<Object> get props => [profiles];
}

class UpdatedProfileState extends ProfilesState {
  final Profile profile;

  UpdatedProfileState(this.profile);

  @override List<Object> get props => [profile];
}

class ErrorState extends ProfilesState {
  @override
  List<Object> get props => [];
}