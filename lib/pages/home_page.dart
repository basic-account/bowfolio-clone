import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import '../bloc/tabs/tabs_cubit.dart';
import '../models/tabs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, Tabs>(
      builder: (context, tab) {
        return Scaffold(
          appBar: AppBar(
            title: Text('TESTING'),
          ),
          body: Builder(
            builder: (context) {
              if (tab == Tabs.home)
                return Home();
              else if(tab == Tabs.profiles)
                return ProfilesList();
              else if(tab == Tabs.projects)
                return ProjectsList();
              else if(tab == Tabs.interests)
                return InterestsList();
              else if(tab == Tabs.addProject)
                return AddProject();
              else if(tab == Tabs.filter)
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
