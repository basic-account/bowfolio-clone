import 'package:bowfolio/bloc/profiles/filtered_profiles_state.dart';
import 'package:bowfolio/bloc/profiles/profiles_cubit.dart';
import 'package:bowfolio/bloc/profiles/profiles_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';

class FilteredProfilesSelect extends StatelessWidget {
  final String query;

  FilteredProfilesSelect(this.query);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesSearchCubit, FilteredProfilesState>(
      builder: (context, state) {
        if (state is FilteredLoadingState) {
          return LoadingIndicator();
        } else if (state is FilteredLoadedState) {
          final profiles = state.profiles;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (BuildContext context, int index) {
              final profile = profiles[index];
              return Text(profile.email);
            },
          );
        } else if (state is FilteredErrorState) {
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
