import 'package:equatable/equatable.dart';

import '../../models/profile.dart';

abstract class ProfilesEvent extends Equatable {
  const ProfilesEvent();

  @override
  List<Object> get props => [];
}

class LoadProfiles extends ProfilesEvent {}

class AddProfile extends ProfilesEvent {
  final Profile profile;

  const AddProfile(this.profile);

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'AddProfile { Profile: $profile }';
}

class UpdateProfile extends ProfilesEvent {
  final Profile updatedProfile;

  const UpdateProfile(this.updatedProfile);

  @override
  String toString() => 'UpdateProfile { updatedProfile: $updatedProfile }';
}

class DeleteProfile extends ProfilesEvent {
  final Profile profile;

  const DeleteProfile(this.profile);

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'DeleteProfile { Profile: $profile }';
}