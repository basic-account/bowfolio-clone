import 'package:bowfolio/bloc/bloc.dart';
import 'package:bowfolio/bloc/profiles/profiles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesBloc, ProfilesState>(
      builder: (context, state) {
        if (state is ProfilesLoading) {
          return Container(); //TODO
        } else if (state is ProfilesLoaded) {
          final profiles = state.profiles;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (BuildContext context, int index) {
              final profile = profiles[index];
              return Container(
                height: 300,
                width: 300,
                child: Text(profile.first) /*Column(
                  children: [
                    Text(profile.first),
                    Text(profile.last),
                    Text(profile.bio),
                    Text(profile.email),
                    Text(profile.picture),
                  ],
                ),*/
              );
            },
          );
        } else {
          return Container(); //TODO
        }
      },
    );
  }
}
