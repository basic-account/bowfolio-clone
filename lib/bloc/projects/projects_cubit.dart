import 'package:bowfolio/models/project.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'projects_state.dart';
import '../../repository/repository.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit({this.repository}) : super(InitialState()) {
    getProjects();
  }

  final ProjectsRepository repository;

  void getProjects() async {
    try {
      emit(LoadingState());
      final projects = await repository.getProjects();
      emit(LoadedState(projects));
    } catch (e) {
      emit(ErrorState());
    }
  }

    void updateProject(Project project) async {
    try {
      emit(LoadingState());
      final projects = await repository.addOrUpdateProject(project: project);
      emit(LoadedState(projects));
    } catch (e) {
      emit(ErrorState());
    }
  }
}