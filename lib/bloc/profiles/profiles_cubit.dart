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

  void updateProfile(Profile profile) async {
    try {
      emit(LoadingState());
      final profiles = await repository.updateProfile(profile);
      emit(LoadedState(profiles));
    } catch (e) {
      emit(ErrorState());
    }
  }
}