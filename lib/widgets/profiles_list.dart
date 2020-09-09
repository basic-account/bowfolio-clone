import 'package:bowfolio/bloc/bloc.dart';
import 'package:bowfolio/bloc/profiles/profiles_bloc.dart';
import 'package:bowfolio/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesBloc, ProfilesState>(
      builder: (context, state) {
        if (state is ProfilesLoading) {
          return LoadingIndicator();
        } else if (state is ProfilesLoaded) {
          print('here');
          final profiles = state.profiles;
          return Container(child: Text('init'),);
          
          /*ListView.builder(
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
          );*/
        } else if (state is ProfilesNotLoaded) {
          return Container(child: Text('not loaded'),); //TODO
        } else {
          return Container(child: Text('how did you get here'),);
        }
      },
    );
  }
}
