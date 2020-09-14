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
}