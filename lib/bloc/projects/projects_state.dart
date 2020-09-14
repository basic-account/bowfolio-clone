import 'package:equatable/equatable.dart';

import '../../models/project.dart';

abstract class ProjectsState extends Equatable {}

class InitialState extends ProjectsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ProjectsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ProjectsState {
  final List<Project> projects;

  LoadedState(this.projects);

  @override
  List<Object> get props => [projects];
}

class ErrorState extends ProjectsState {
  @override
  List<Object> get props => [];
}