import 'package:bowfolio/widgets/project_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import '../bloc/tabs/tabs_cubit.dart';
import '../models/tabs.dart';
import '../widgets/screens/add_edit_project.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); //makes it a full screen app
    return BlocBuilder<TabsCubit, Tabs>(
      builder: (context, tab) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (tab == Tabs.home)
                return Home();
              else if (tab == Tabs.profiles)
                return ProfilesList();
              else if (tab == Tabs.projects)
                return ProjectsList();
              else if (tab == Tabs.interests)
                return InterestsList();
              else if (tab == Tabs.addProject)
                return ProjectForm();
              else if (tab == Tabs.filter)
                return FilterView();
              else
                return Text('???');
            },
          ),
          bottomNavigationBar: TabSelector(
            activeTab: tab,
            onTabSelected: (tab) => context.bloc<TabsCubit>().updateTab(tab),
          ),
        );
      },
    );
  }
}
