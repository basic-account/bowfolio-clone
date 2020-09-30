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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = ''; // = context.bloc<AuthenticationBloc>().state;

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
                        onSave: null,
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

    /*BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            setState(() {
              email = state.user.email;
            });
            break;
          case AuthenticationStatus.unauthenticated:
            setState(() {
              email = 'jj';
            });
            break;
          default:
            break;
        }
      },
      child: email == ''
          ? MultiBlocProvider(providers: [
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
            ], child: LoginForm())
          : AddEditProfile(
              onSave: null,
              isEditing: false,
              email: email,
            ),
    );*/

    /*auth.status == AuthenticationStatus.authenticated
        ? BlocBuilder<ProfilesCubit, ProfilesState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return LoadingIndicator();
              } else if (state is LoadedState) {
                final profile = state.profiles.firstWhere(
                    (profile) => profile.email == auth.user.email,
                    orElse: () => null);

                return profile == null
                    ? AddEditProfile(
                        onSave: null,
                        isEditing: false,
                        email: auth.user.email,
                      )
                    : AddEditProfile(
                        onSave: null,
                        isEditing: false,
                        //profile: profile,
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
          )
        : MultiBlocProvider(providers: [
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
          ], child: LoginForm());*/

    //return Container();
    /*final profile = st
        if(state is LoadingState)
          return LoadingIndicator();
        else if (state is LoadedState)






        if (state.status == AuthenticationStatus.authenticated)
          return AddEditProfile(profile: .cop user.email);*/
  }
}
