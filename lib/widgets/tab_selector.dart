import 'package:bowfolio/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';

import '../models/tabs.dart';

class TabSelector extends StatelessWidget {
  final Tabs activeTab;
  final Function(Tabs) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          fixedColor: Colors.green,
          unselectedItemColor: Colors.lightGreen,
          currentIndex: Tabs.values.indexOf(activeTab),
          onTap: (index) => onTabSelected(Tabs.values[index]),
          items: state.status == AuthenticationStatus.authenticated
              ? Tabs.values.map((tab) {
                  return BottomNavigationBarItem(
                    icon: Builder(
                      builder: (context) {
                        if (tab == Tabs.home)
                          return Icon(Icons.home);
                        else if (tab == Tabs.profiles)
                          return Icon(Icons.face);
                        else if (tab == Tabs.projects)
                          return Icon(Icons.work);
                        else if (tab == Tabs.interests)
                          return Icon(Icons.toys);
                        else if (tab == Tabs.addProject)
                          return Icon(Icons.add);
                        else if (tab == Tabs.filter)
                          return Icon(Icons.filter_list);
                        else
                          return Icon(Icons.show_chart);
                      },
                    ),
                    title: Builder(
                      builder: (context) {
                        if (tab == Tabs.home)
                          return Text('home');
                        else if (tab == Tabs.profiles)
                          return Text('profiles');
                        else if (tab == Tabs.projects)
                          return Text('projects');
                        else if (tab == Tabs.interests)
                          return Text('interests');
                        else if (tab == Tabs.addProject)
                          return Text('add project');
                        else if (tab == Tabs.filter)
                          return Text('filter');
                        else
                          return Text('dunno');
                      },
                    ),
                  );
                }).toList()
              : UnauthTabs.values.map((tab) {
                  return BottomNavigationBarItem(
                    icon: Builder(
                      builder: (context) {
                        if (tab == UnauthTabs.home)
                          return Icon(Icons.home);
                        else if (tab == UnauthTabs.profiles)
                          return Icon(Icons.face);
                        else if (tab == UnauthTabs.projects)
                          return Icon(Icons.work);
                        else if (tab == UnauthTabs.interests)
                          return Icon(Icons.toys);
                        else
                          return Icon(Icons.show_chart);
                      },
                    ),
                    title: Builder(
                      builder: (context) {
                        if (tab == UnauthTabs.home)
                          return Text('home');
                        else if (tab == UnauthTabs.profiles)
                          return Text('profiles');
                        else if (tab == UnauthTabs.projects)
                          return Text('projects');
                        else if (tab == UnauthTabs.interests)
                          return Text('interests');
                        else
                          return Text('dunno');
                      },
                    ),
                  );
                }).toList(),
        );
      },
    );
  }
}
