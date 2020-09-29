import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profiles/profiles.dart';
import 'loading_indicator.dart';

class FilteredProfilesSelect extends StatelessWidget {
  final String query;

  FilteredProfilesSelect(this.query);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesCubit, ProfilesState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingIndicator();
        } else if (state is LoadedState) {
          final profiles = state.profiles.where((profile) => profile.email.contains(query)).toList();
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (BuildContext context, int index) {
              final profile = profiles[index];
              return Text(profile.email);
            },
          );
        } else if (state is ErrorState) {
          return Container(
            child: Text('not loaded'),
          );
        } else {
          return Container(
            child: Text('how did you get here'),
          );
        }
      },
    );
  }
}