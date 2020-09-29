import 'package:bowfolio/models/profile.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredProfilesEvent extends Equatable {
  const FilteredProfilesEvent();
}

class QueryUpdated extends FilteredProfilesEvent {
  final String query;

  const QueryUpdated(this.query);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'QueryUpdated { query: $query }';
}

class ProfilesUpdated extends FilteredProfilesEvent {
  final List<Profile> profiles;

  const ProfilesUpdated(this.profiles);

  @override
  List<Object> get props => [profiles];

  @override
  String toString() => 'ProfilesUpdated { profiles: $profiles }';
}