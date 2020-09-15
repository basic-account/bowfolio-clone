import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';
import '../bloc/profiles/profiles.dart';


class ProfileImage extends StatelessWidget {
  final String profileId;

  ProfileImage({
    @required this.profileId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilesCubit, ProfilesState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingIndicator();
        } else if (state is LoadedState) {
          final profile =
              state.profiles.firstWhere((profile) => profile.email == profileId);
          return Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0),
            child: Container(
              width: 40, //same as parent height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(profile.picture),
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
