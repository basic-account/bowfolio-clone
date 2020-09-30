import 'package:equatable/equatable.dart';

import '../../models/profile.dart';

abstract class ProfilesState extends Equatable {
  const ProfilesState();

  @override
  List<Object> get props => [];
}

class ProfilesLoading extends ProfilesState {}

class ProfilesLoaded extends ProfilesState {
  final List<Profile> profiles;

  const ProfilesLoaded([this.profiles = const[]]);

  @override
  List<Object> get props => [profiles];

  @override
  String toString() {
    return 'ProfilesLoaded { profiles: $profiles }';
  }
}

class ProfilesNotLoaded extends ProfilesState {}