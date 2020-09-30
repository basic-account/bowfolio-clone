/*import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bowfolio/bloc/profiles/profiles_cubit.dart';
import 'package:bowfolio/models/profile.dart';
import 'package:meta/meta.dart';

import 'filtered_profiles_event.dart';
import 'filtered_profiles_state.dart';

class FilteredProfilesBloc
    extends Bloc<FilteredProfilesEvent, FilteredProfilesState> {
  final ProfilesCubit profilesCubit;
  StreamSubscription profilesSubscription;

  FilteredProfilesBloc({@required this.profilesCubit})
      : super(
          profilesCubit.state is ProfilesLoaded
              ? FilteredProfilesLoadSuccess(
                  (profilesCubit.state as ProfilesLoaded).profiles,
                  '',
                )
              : FilteredProfilesLoadInProgress(),
        ) {
    profilesSubscription = profilesCubit.listen((state) {
      if (state is ProfilesLoaded) {
        add(ProfilesUpdated((profilesCubit.state as ProfilesLoaded).profiles));
      }
    });
  }

  @override
  Stream<FilteredProfilesState> mapEventToState(
      FilteredProfilesEvent event) async* {
    if (event is QueryUpdated) {
      yield* _mapUpdateQueryToState(event);
    } else if (event is ProfilesUpdated) {
      yield* _mapProfilesUpdatedToState(event);
    }
  }

  Stream<FilteredProfilesState> _mapUpdateQueryToState(
    QueryUpdated event,
  ) async* {
    if (profilesCubit.state is ProfilesLoaded) {
      yield FilteredProfilesLoadSuccess(
        _mapProfilesToFilteredProfiles(
          (profilesCubit.state as ProfilesLoaded).profiles,
          event.query,
        ),
        event.query,
      );
    }
  }

  Stream<FilteredProfilesState> _mapProfilesUpdatedToState(
    ProfilesUpdated event,
  ) async* {
    final query = state is FilteredProfilesLoadSuccess
        ? (state as FilteredProfilesLoadSuccess).query
        : '';
    yield FilteredProfilesLoadSuccess(
      _mapProfilesToFilteredProfiles(
        (profilesCubit.state as ProfilesLoaded).profiles,
        query,
      ),
      query,
    );
  }

  List<Profile> _mapProfilesToFilteredProfiles(
      List<Profile> profiles, String query) {
    return profiles;//.where((profile) => profile.email.contains(query)).toList();
  }

  @override
  Future<void> close() {
    profilesSubscription.cancel();
    return super.close();
  }
}
*/