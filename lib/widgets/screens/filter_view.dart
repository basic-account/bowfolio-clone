import 'package:bowfolio/bloc/interests/interests.dart';
import 'package:bowfolio/bloc/profiles/profiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_indicator.dart';
import '../profile_item.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  TextEditingController _controller = TextEditingController();
  String _query = '';

  List<String> interestIds = [''];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    interestIds[0] == ''
                        ? Container()
                        : Container(
                            height: 30,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: interestIds.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      interestIds[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(labelText: 'interest', hintText: 'Type an interest...'),
                        validator: (val) {
                          return val.trim().isEmpty ? 'empty' : null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _query = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _query = '';
                            _controller.clear();
                          });
                        },
                      ),
                    ),
                    BlocBuilder<InterestsCubit, InterestsState>(
                      builder: (context, inState) {
                        if (inState is InterestsLoadedState) {
                          final interests = inState.interests
                              .where((interest) => interest.interest
                                  .toLowerCase()
                                  .contains(_query.toLowerCase()))
                              .toList();

                          return _query == ''
                              ? Container()
                              : Container(
                                  height: 100,
                                  child: ListView.builder(
                                    itemCount: interests.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final interest = interests[index];
                                      return FlatButton(
                                        child: Text(interest.interest),
                                        onPressed: () {
                                          setState(() {
                                            interestIds[0] == ''
                                                ? interestIds.replaceRange(
                                                    0, 1, [interest.interest])
                                                : interestIds
                                                    .add(interest.interest);
                                            _query = '';
                                          });
                                        },
                                      );
                                    },
                                  ),
                                );
                        } else
                          return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 600,
                child: BlocBuilder<ProfilesCubit, ProfilesState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return LoadingIndicator();
                    } else if (state is LoadedState) {
                      final profiles = state.profiles
                          .where((profile) => profile.interestIds
                              .any((interest) => interestIds.contains(interest)))
                          .toList();
                      return ListView.builder(
                        itemCount: profiles.length,
                        itemBuilder: (BuildContext context, int index) {
                          final profile = profiles[index];
                          return ProfileItem(profile: profile);
                        },
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
