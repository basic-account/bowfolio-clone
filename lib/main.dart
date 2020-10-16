import 'package:bowfolio/bloc/add_project/add_project_cubit.dart';
import 'package:bowfolio/bloc/authentication/authentication_bloc.dart';
import 'package:bowfolio/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:user_repository/user_repository.dart';

import 'bloc/add_profile/add_profile_cubit.dart';
import 'bloc/simple_bloc_observer.dart';
import 'bloc/profiles/profiles.dart';
import 'bloc/interests/interests.dart';
import 'bloc/projects/projects.dart';
import 'bloc/tabs/tabs_cubit.dart';
import 'pages/home_page.dart';
import 'repository/repository.dart';
import 'utils/routes.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfilesCubit>(
          create: (context) => ProfilesCubit(
            repository: ProfilesRepository(),
          ),
        ),
        BlocProvider<InterestsCubit>(
          create: (context) => InterestsCubit(
            repository: InterestsRepository(),
          ),
        ),
        BlocProvider<ProjectsCubit>(
          create: (context) => ProjectsCubit(
            repository: ProjectsRepository(),
          ),
        ),
        BlocProvider<TabsCubit>(
          create: (context) => TabsCubit(),
        ),
        BlocProvider<AddProjectCubit>(
          create: (context) => AddProjectCubit(
            ProjectsRepository(),
          ),
        ),
      ],
      child: BowfoliosApp(
        authenticationRepository: AuthenticationRepository(),
        userRepository: UserRepository(),
      ),
    ),
  );
}

class BowfoliosApp extends StatelessWidget {
  const BowfoliosApp({
    Key key,
    @required this.authenticationRepository,
    @required this.userRepository,
  })  : assert(authenticationRepository != null),
        assert(userRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: 
         MaterialApp(
           theme: ThemeData(
             highlightColor: Colors.green,
             accentColor: Colors.green,
             primaryColor: Colors.green,
           ),
          title: 'Bowfolios App',
          routes: {
            Routes.home: (context) {
              return HomePage();
            }
          },
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
