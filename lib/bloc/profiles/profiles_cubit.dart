import 'package:bowfolio/models/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profiles_state.dart';
import '../../repository/repository.dart';

class ProfilesCubit extends Cubit<ProfilesState> {
  ProfilesCubit({this.repository}) : super(InitialState()) {
    _getProfiles();
  }

  final ProfilesRepository repository;

  void _getProfiles() async {
    try {
      emit(LoadingState());
      final profiles = await repository.getProfiles();
      emit(LoadedState(profiles));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void updateProfile({
    String first,
    String last,
    String email,
    String title,
    String bio,
    String picture,
    List<String> interestIds,
    List<String> projectIds,
  }) async {
    try {
      emit(LoadingState());
      final profiles = await repository.addOrUpdateProfile(
        first: first,
        last: last,
        email: email,
        title: title,
        bio: bio,
        picture: picture,
        interestIds: interestIds,
        projectIds: projectIds,
      );
      emit(LoadedState(profiles));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
