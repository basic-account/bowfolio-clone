import 'package:bowfolio/bloc/authentication/authentication_bloc.dart';
import 'package:bowfolio/bloc/profiles/profiles.dart';
import 'package:bowfolio/bloc/signup/signup_cubit.dart';
import 'package:bowfolio/widgets/widgets.dart';
import '../../models/profile.dart';
import 'package:bowfolio/bloc/login/login_bloc.dart';
import 'package:bowfolio/widgets/add_edit_profile.dart';
import 'package:bowfolio/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authentication_repository/authentication_repository.dart';

//Login Screen, which changes into a profile edit screen upon authentication
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated)
          //isedit based on new user
          return BlocBuilder<ProfilesCubit, ProfilesState>(
            builder: (context, profileState) {
              if (profileState is LoadingState) {
                return LoadingIndicator();
              } else if (profileState is LoadedState) {
                final profile = profileState.profiles.firstWhere(
                    (profile) => profile.email == state.user.email,
                    orElse: () => null);

                return profile == null
                    ? AddEditProfile(
                        onSave: null,
                        isEditing: false,
                        email: state.user.email,
                      )
                    : AddEditProfile(
                        onSave: (first, last, email, bio, title, picture,
                            interestIds, projectIds) {
                          BlocProvider.of<ProfilesCubit>(context).updateProfile(
                            profile.copyWith(
                              first: first,
                              last: last,
                              email: email,
                              bio: bio,
                              title: title,
                              picture: picture,
                              interestIds: interestIds,
                              projectIds: projectIds,
                            ),
                          );
                        },
                        isEditing: true,
                        profile: profile,
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
        else
          return MultiBlocProvider(providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              ),
            ),
            BlocProvider<SignUpCubit>(
              create: (context) => SignUpCubit(
                RepositoryProvider.of<AuthenticationRepository>(context),
              ),
            ),
          ], child: LoginForm());
      },
    );
  }
}
