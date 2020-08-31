import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profiles/profiles_event.dart';
import '../../bloc/profiles/profiles_state.dart';
import '../../repository/profiles/profiles_repository.dart';
import '../../models/profile.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  final ProfilesRepository profilesRepository;

  ProfilesBloc({@required this.profilesRepository});

  @override
  ProfilesState get initialState => ProfilesLoading();

  @override
  Stream<ProfilesState> mapEventToState(ProfilesEvent event) async* {
    if (event is LoadProfiles) {
      yield* _mapLoadProfilesToState();
    } else if (event is AddProfile) {
      yield* _mapAddProfileToState(event);
    } else if (event is UpdateProfile) {
      yield* _mapUpdateProfileToState(event);
    } else if (event is DeleteProfile) {
      yield* _mapDeleteProfileToState(event);
    }
  }

  Stream<ProfilesState> _mapLoadProfilesToState() async* {
    try {
      final profiles = await this.profilesRepository.loadProfiles();
      yield ProfilesLoaded(
        profiles.map(Profile.fromEntity).toList(),
      );
    } catch (_) {
      yield ProfilesNotLoaded();
    }
  }

  Stream<ProfilesState> _mapAddProfileToState(AddProfile event) async* {
    if (state is ProfilesLoaded) {
      final List<Profile> updatedProfiles = List.from((state as ProfilesLoaded).profiles)
        ..add(event.profile);
      yield ProfilesLoaded(updatedProfiles);
      _saveProfiles(updatedProfiles);
    }
  }

  Stream<ProfilesState> _mapUpdateProfileToState(UpdateProfile event) async* {
    if (state is ProfilesLoaded) {
      final List<Profile> updatedProfiles = (state as ProfilesLoaded).profiles.map((profile) {
        return profile.email == event.updatedProfile.email ? event.updatedProfile : Profile;
      }).toList();
      yield ProfilesLoaded(updatedProfiles);
      _saveProfiles(updatedProfiles);
    }
  }

  Stream<ProfilesState> _mapDeleteProfileToState(DeleteProfile event) async* {
    if (state is ProfilesLoaded) {
      final updatedProfiles = (state as ProfilesLoaded)
          .profiles
          .where((profile) => profile.email != event.profile.email)
          .toList();
      yield ProfilesLoaded(updatedProfiles);
      _saveProfiles(updatedProfiles);
    }
  }

  Future _saveProfiles(List<Profile> profiles) {
    return profilesRepository.saveProfiles(
      profiles.map((profile) => profile.toEntity()).toList(),
    );
  }
}
