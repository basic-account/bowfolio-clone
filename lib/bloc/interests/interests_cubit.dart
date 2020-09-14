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
      emit(LoadingState());
      final interests = await repository.getInterests();
      emit(LoadedState(interests));
    } catch (e) {
      emit(ErrorState());
    }
  }
}