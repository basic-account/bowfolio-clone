import 'package:equatable/equatable.dart';

import '../../models/profile.dart';

abstract class FilteredProfilesState extends Equatable {}

class FilteredInitialState extends FilteredProfilesState {
  @override
  List<Object> get props => [];
}

class FilteredLoadingState extends FilteredProfilesState {
  @override
  List<Object> get props => [];
}

class FilteredLoadedState extends FilteredProfilesState {
  final List<Profile> profiles;

  FilteredLoadedState(this.profiles);

  @override
  List<Object> get props => [profiles];
}

class FilteredProfilesLoaded extends FilteredProfilesState {
  final List<Profile> profiles;

  FilteredProfilesLoaded(this.profiles);

  @override
  List<Object> get props => [profiles];
}

class FilteredErrorState extends FilteredProfilesState {
  @override
  List<Object> get props => [];
}
