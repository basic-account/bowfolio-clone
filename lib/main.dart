import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/simple_bloc_observer.dart';
import 'bloc/profiles/profiles.dart';
import 'bloc/interests/interests.dart';
import 'bloc/projects/projects.dart';
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
      ],
      child: BowfoliosApp(),
    ),
  );

  /*runApp(
    BlocProvider(
      create: (context) {
        return ProfilesBloc(
          profilesRepository: const ProfilesConcreteRepository(
            localStorage: const ProfilesFileStorage(
              '__bow12_profiles__',
              getApplicationDocumentsDirectory,
            ),
          ),
        )..add(LoadProfiles());
      },
      child: BowfolioApp(),
    ),
  );*/
}

class BowfoliosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bowfolios App',
      routes: {
        Routes.home: (context) {
          return HomePage();
        }
      },
    );
  }
}
