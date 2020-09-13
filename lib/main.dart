import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'pages/home_page.dart';
import 'repository/repository.dart';
import 'utils/routes.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(
    BlocProvider<ProfilesCubit>(
      create: (context) => ProfilesCubit(
        repository: ProfileRepository(),
      ),
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
