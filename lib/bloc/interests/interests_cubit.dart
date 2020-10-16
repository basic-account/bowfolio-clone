import 'package:flutter_bloc/flutter_bloc.dart';

import 'interests_state.dart';
import '../../repository/repository.dart';

class InterestsCubit extends Cubit<InterestsState> {
  InterestsCubit({this.repository}) : super(InitialState()) {
    _getInterests();
  }

  final InterestsRepository repository;

  void _getInterests() async {
    try {
      emit(InterestsLoadingState());
      final interests = await repository.getInterests();
      emit(InterestsLoadedState(interests));
    } catch (e) {
      emit(InterestsErrorState());
    }
  }

  void profileUpdatedInterests(String email, List<String> interestIds) async {
        try {
      emit(InterestsLoadingState());
      final interests = await repository.profileUpdatedInterests(email, interestIds);
      emit(InterestsLoadedState(interests));
    } catch (e) {
      emit(InterestsErrorState());
    }
  }
}