import 'dart:async';

import 'package:bowfolio/bloc/profiles/profiles_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profiles_state.dart';
import 'filtered_profiles_state.dart';
import 'profiles_cubit.dart';

class ProfilesSearchCubit extends Cubit<FilteredProfilesState> {
  ProfilesSearchCubit({this.profilesCubit}) : super(FilteredInitialState()) {
    profilesSubscription = profilesCubit.listen((state) {
      if (state is LoadedState) emit(FilteredLoadedState(state.profiles));
    });
  }

  final ProfilesCubit profilesCubit;
  StreamSubscription profilesSubscription;

  void filter(String query) async {
    //if (FilteredProfilesState is FilteredLoadedState) {

    try {     
      final filteredProfiles = (state as FilteredLoadedState).profiles.where((profile) => profile.email.contains(query));
      /*final filteredProfiles = profilesCubit.
          .profiles
          .where((profile) => profile.email.contains(query));*/
      emit(FilteredLoadedState(filteredProfiles));
      // }
      //else
    } catch (e) {
      emit(FilteredErrorState());
    }
  }

  void _searchProfiles() async {
    try {
      emit(FilteredLoadingState());
      final filteredProfiles = (profilesCubit as LoadedState)
          .profiles; //.where((profile) => profile.email.contains(query));
      emit(FilteredLoadedState(filteredProfiles));
    } catch (e) {
      emit(FilteredErrorState());
    }
  }

  @override
  Future<void> close() {
    profilesSubscription.cancel();
    return super.close();
  }
}
