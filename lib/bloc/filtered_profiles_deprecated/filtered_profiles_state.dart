import 'package:bowfolio/models/profile.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredProfilesState extends Equatable {
  const FilteredProfilesState();

  @override
  List<Object> get props => [];
}

class FilteredProfilesLoadInProgress extends FilteredProfilesState {}

class FilteredProfilesLoadSuccess extends FilteredProfilesState {
  final List<Profile> profiles;
  final String query;
  
  const FilteredProfilesLoadSuccess(this.profiles, this.query);

  @override
  List<Object> get props => [profiles, query];

  @override
  String toString() {
    return 'FilteredProfilesStateLoadSuccess { profiles: $profiles, query: $query }';
  }
}

class FilteredProfilesError extends FilteredProfilesState {}