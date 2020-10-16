import 'package:bowfolio/bloc/add_project/add_project_cubit.dart';
import 'package:bowfolio/bloc/interests/interests_cubit.dart';
import 'package:bowfolio/bloc/interests/interests_state.dart';
import 'package:bowfolio/bloc/profiles/profiles.dart';
import 'package:bowfolio/bloc/projects/projects_cubit.dart';
import 'package:bowfolio/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ProjectForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProjectCubit, AddProjectState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Add Project',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _NameInput(),
                  const SizedBox(height: 8.0),
                  _PictureInput(),
                  const SizedBox(height: 8.0),
                  _HomepageInput(),
                  const SizedBox(height: 8.0),
                  _DescriptionInput(),
                  const SizedBox(height: 4.0),
                  _InterestIdsInput(),
                  const SizedBox(height: 8.0),
                  _ProfileIdsInput(),
                  const SizedBox(height: 8.0),
                  _SubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (name) =>
                context.bloc<AddProjectCubit>().nameChanged(name),
            decoration: InputDecoration(
              labelText: 'name',
              errorText: state.name.invalid ? 'invalid name' : null,
            ),
          ),
        );
      },
    );
  }
}

class _PictureInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) => previous.picture != current.picture,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (picture) =>
                context.bloc<AddProjectCubit>().pictureChanged(picture),
            decoration: InputDecoration(
              labelText: 'picture',
              errorText:
                  state.picture.invalid ? 'invalid picture by url' : null,
            ),
          ),
        );
      },
    );
  }
}

class _HomepageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) => previous.homepage != current.homepage,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (homepage) =>
                context.bloc<AddProjectCubit>().homepageChanged(homepage),
            decoration: InputDecoration(
              labelText: 'homepage',
              errorText: state.homepage.invalid ? 'invalid homepage' : null,
            ),
          ),
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (description) =>
                context.bloc<AddProjectCubit>().descriptionChanged(description),
            decoration: InputDecoration(
              labelText: 'description',
              errorText:
                  state.description.invalid ? 'invalid description' : null,
            ),
          ),
        );
      },
    );
  }
}

class _InterestIdsInput extends StatefulWidget {
  @override
  __InterestIdsInputState createState() => __InterestIdsInputState();
}

class __InterestIdsInputState extends State<_InterestIdsInput> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) =>
          previous.interestIds != current.interestIds,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                state.interestIds.value[0] == ''
                    ? Container()
                    : Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.interestIds.value.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  state.interestIds.value[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'interests', hintText: 'Type an interest...'),
                  validator: (val) {
                    return val.trim().isEmpty ? 'empty' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _query = value;
                    });
                  },
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
                                      state.interestIds.value[0] == ''
                                          ? context
                                              .bloc<AddProjectCubit>()
                                              .interestIdsChanged(
                                                  [interest.interest])
                                          : context
                                              .bloc<AddProjectCubit>()
                                              .interestIdsChanged([
                                              ...state.interestIds.value,
                                              interest.interest
                                            ]);
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
        );
      },
    );
  }
}

class _ProfileIdsInput extends StatefulWidget {
  @override
  __ProfileIdsInputState createState() => __ProfileIdsInputState();
}

class __ProfileIdsInputState extends State<_ProfileIdsInput> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) =>
          previous.profileIds != current.profileIds,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                state.profileIds.value[0] == ''
                    ? Container()
                    : Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.profileIds.value.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  state.profileIds.value[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'participants',
                      hintText: 'Type a profile email...'),
                  validator: (val) {
                    return val.trim().isEmpty ? 'empty' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _query = value;
                    });
                  },
                ),
                BlocBuilder<ProfilesCubit, ProfilesState>(
                  builder: (context, inState) {
                    if (inState is LoadedState) {
                      final profiles = inState.profiles
                          .where((profile) => profile.email
                              .toLowerCase()
                              .contains(_query.toLowerCase()))
                          .toList();

                      return _query == ''
                          ? Container()
                          : Container(
                              height: 100,
                              child: ListView.builder(
                                itemCount: profiles.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final profile = profiles[index];
                                  return FlatButton(
                                    child: Text(profile.email),
                                    onPressed: () {
                                      state.interestIds.value[0] == ''
                                          ? context
                                              .bloc<AddProjectCubit>()
                                              .profileIdsChanged(
                                                  [profile.email])
                                          : context
                                              .bloc<AddProjectCubit>()
                                              .profileIdsChanged(
                                              [
                                                ...state.profileIds.value,
                                                profile.email
                                              ],
                                            );
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
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
              
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                //key: const Key('loginForm_continue_raisedButton'),
                child: const Text(
                  'Submit Project',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: state.status.isValidated
                    ? () {
                        context
                            .bloc<AddProjectCubit>()
                            .addProjectFormSubmitted();
                        context.bloc<ProjectsCubit>().updateProject(Project(
                              name: state.name.value,
                              picture: state.picture.value,
                              homepage: state.homepage.value,
                              description: state.description.value,
                              interestIds: state.interestIds.value,
                              profileIds: state.profileIds.value,
                            ));
                      }
                    : null,
              );
      },
    );
  }
}
