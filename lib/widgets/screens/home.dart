import 'package:bowfolio/bloc/authentication/authentication_bloc.dart';
import 'package:bowfolio/bloc/profiles/profiles.dart';
import 'package:bowfolio/bloc/signup/signup_cubit.dart';
import 'package:bowfolio/widgets/widgets.dart';
import '../../models/profile.dart';
import 'package:bowfolio/bloc/login/login_bloc.dart';
import 'package:bowfolio/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authentication_repository/authentication_repository.dart';

import '../profile_form.dart';

//Login Screen, which changes into a profile edit screen upon authentication
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool editState = true;

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

                return editState
                    ? profile == null
                        ? ProfileForm(
                            isEditing: false,
                            profile: Profile(
                              email: state.user.email,
                            ),
                            editState: () {
                              setState(() {
                                editState = false;
                              });
                            },
                          )
                        : ProfileForm(
                            isEditing: true,
                            profile: Profile(
                              first: profile.first,
                              last: profile.last,
                              email: profile.email,
                              bio: profile.bio,
                              title: profile.title,
                              picture: profile.picture,
                              interestIds: profile.interestIds,
                              projectIds: profile.projectIds,
                            ),
                            editState: () {
                              setState(() {
                                editState = false;
                              });
                            },
                          )
                    : profile == null
                        ? ProfileForm(
                            isEditing: false,
                            profile: Profile(
                              email: state.user.email,
                            ),
                            editState: () {
                              setState(() {
                                editState = false;
                              });
                            },
                          )
                        : Column(
                            children: [
                              Text(
                                'Your Profile',
                                textScaleFactor: 2,
                                style: TextStyle(color: Colors.green),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        profile.email,
                                      ),
                                    ),
                                    RaisedButton(
                                      child: const Text(
                                        'Logout?',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.green,
                                      onPressed: () {
                                        context.bloc<AuthenticationBloc>().add(
                                            AuthenticationLogoutRequested());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ProfileItem(
                                profile: profile,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.green,
                                //key: const Key('loginForm_continue_raisedButton'),
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    editState = true;
                                  });
                                },
                              ),
                            ],
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
