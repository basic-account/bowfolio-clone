import 'package:bowfolio/bloc/projects/projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';

class ProjectImage extends StatelessWidget {
  final String projectId;

  ProjectImage({
    @required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingIndicator();
        } else if (state is LoadedState) {
          final project =
              state.projects.firstWhere((project) => project.name == projectId);
          return Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            child: Container(
              width: 40, //same as parent height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(project.picture),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
