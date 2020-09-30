import 'package:bowfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_indicator.dart';
import '../../bloc/projects/projects.dart';

class ProjectsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingIndicator();
        } else if (state is LoadedState) {
          final projects = state.projects;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (BuildContext context, int index) {
              final project = projects[index];
              return ProjectItem(project: project);
            },
          );
        } else if (state is ErrorState) {
          return Container(
            child: Text('not loaded'),
          ); //TODO
        } else {
          return Container(
            child: Text('how did you get here'),
          );
        }
      },
    );
  }
}
