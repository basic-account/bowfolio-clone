import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/profiles/profiles_bloc.dart';
import 'bloc/profiles/profiles_event.dart';
import 'bloc/simple_bloc_delegate.dart';
import 'pages/home_page.dart';
import 'repository/profiles/profiles_concrete_repo.dart';
import 'repository/profiles/profiles_file_storage.dart';
import 'utils/routes.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();

  runApp(
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
  );
}

class BowfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bowfolios App', routes: {
      Routes.home: (context) {
        return HomePage();
      }
    });
  }
}
