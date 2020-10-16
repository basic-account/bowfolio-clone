import 'package:bowfolio/bloc/add_profile/add_profile_cubit.dart';
import 'package:bowfolio/bloc/add_profile/add_profile_state.dart';
import 'package:bowfolio/bloc/authentication/authentication_bloc.dart';
import 'package:bowfolio/bloc/interests/interests.dart';
import 'package:bowfolio/bloc/profiles/profiles_cubit.dart';
import 'package:bowfolio/bloc/projects/projects_cubit.dart';
import 'package:bowfolio/bloc/projects/projects_state.dart';
import 'package:bowfolio/models/profile.dart';
import 'package:bowfolio/repository/profiles/profiles_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ProfileForm extends StatelessWidget {
  final Profile profile;
  final bool isEditing;
  final Function editState;

  ProfileForm({@required this.isEditing, this.profile, this.editState});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProfileCubit(
        ProfilesRepository(),
        isEditing,
        profile,
      ),
      child: BlocListener<AddProfileCubit, AddProfileState>(
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
                        isEditing ? 'Edit Profile' : 'Add Profile',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              profile.email,
                            ),
                          ),
                          RaisedButton(
                            child: const Text(
                              'Logout?',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.green,
                            onPressed: () {
                              context
                                  .bloc<AuthenticationBloc>()
                                  .add(AuthenticationLogoutRequested());
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _FirstNameInput(isEditing, profile.first),
                    const SizedBox(height: 8.0),
                    _LastNameInput(isEditing, profile.last),
                    const SizedBox(height: 8.0),
                    _BioInput(isEditing, profile.bio),
                    const SizedBox(height: 8.0),
                    _TitleInput(isEditing, profile.title),
                    const SizedBox(height: 8.0),
                    _PictureInput(isEditing, profile.picture),
                    const SizedBox(height: 8.0),
                    _InterestIdsInput(isEditing, profile.interestIds),
                    const SizedBox(height: 8.0),
                    _ProjectIdsInput(isEditing, profile.projectIds),
                    const SizedBox(height: 8.0),
                    _SubmitButton(editState),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  final bool isEditing;
  final String first;

  _FirstNameInput(this.isEditing, this.first);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      buildWhen: (previous, current) => previous.first != current.first,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: isEditing ? first : '',
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (name) =>
                context.bloc<AddProfileCubit>().firstNameChanged(name),
            decoration: InputDecoration(
              labelText: 'First',
              errorText: state.first.invalid ? 'invalid name' : null,
            ),
          ),
        );
      },
    );
  }
}

class _LastNameInput extends StatelessWidget {
  final bool isEditing;
  final String last;

  _LastNameInput(this.isEditing, this.last);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      buildWhen: (previous, current) => previous.last != current.last,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: isEditing ? last : '',
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (name) =>
                context.bloc<AddProfileCubit>().lastNameChanged(name),
            decoration: InputDecoration(
              labelText: 'Last',
              errorText: state.last.invalid ? 'invalid name' : null,
            ),
          ),
        );
      },
    );
  }
}

class _BioInput extends StatelessWidget {
  final bool isEditing;
  final String bio;

  _BioInput(this.isEditing, this.bio);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      buildWhen: (previous, current) => previous.bio != current.bio,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: isEditing ? bio : '',
            //key: const Key('loginForm_usernameInput_textField'),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (name) =>
                context.bloc<AddProfileCubit>().bioChanged(name),
            decoration: InputDecoration(
              labelText: 'Bio',
              errorText: state.last.invalid ? 'invalid bio' : null,
            ),
          ),
        );
      },
    );
  }
}

class _TitleInput extends StatelessWidget {
  final bool isEditing;
  final String title;

  _TitleInput(this.isEditing, this.title);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: isEditing ? title : '',
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (name) =>
                context.bloc<AddProfileCubit>().titleChanged(name),
            decoration: InputDecoration(
              labelText: 'title',
              errorText: state.last.invalid ? 'invalid title' : null,
            ),
          ),
        );
      },
    );
  }
}

class _PictureInput extends StatelessWidget {
  final bool isEditing;
  final String picture;

  _PictureInput(this.isEditing, this.picture);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      buildWhen: (previous, current) => previous.picture != current.picture,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: isEditing ? picture : '',
            //key: const Key('loginForm_usernameInput_textField'),
            onChanged: (name) =>
                context.bloc<AddProfileCubit>().pictureChanged(name),
            decoration: InputDecoration(
              labelText: 'Picture URL',
              errorText: state.last.invalid ? 'invalid url' : null,
            ),
          ),
        );
      },
    );
  }
}

class _ProjectIdsInput extends StatefulWidget {
  final bool isEditing;
  final List<String> projectIds;

  _ProjectIdsInput(this.isEditing, this.projectIds);
  @override
  __ProjectIdsInputState createState() => __ProjectIdsInputState();
}

class __ProjectIdsInputState extends State<_ProjectIdsInput> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
      buildWhen: (previous, current) =>
          previous.projectIds != current.projectIds,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                state.projectIds.value[0] == ''
                    ? Container()
                    : Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.projectIds.value.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  state.projectIds.value[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Type a project name..',
                      hintText: 'Type a project...'),
                  validator: (val) {
                    return val.trim().isEmpty ? 'empty' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _query = value;
                    });
                  },
                ),
                BlocBuilder<ProjectsCubit, ProjectsState>(
                  builder: (context, inState) {
                    if (inState is LoadedState) {
                      final projects = inState.projects
                          .where((project) => project.name
                              .toLowerCase()
                              .contains(_query.toLowerCase()))
                          .toList();

                      return _query == ''
                          ? Container()
                          : Container(
                              height: 100,
                              child: ListView.builder(
                                itemCount: projects.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final project = projects[index];
                                  return FlatButton(
                                    child: Text(project.name),
                                    onPressed: () {
                                      state.interestIds.value[0] == ''
                                          ? context
                                              .bloc<AddProfileCubit>()
                                              .projectIdsChanged([project.name])
                                          : context
                                              .bloc<AddProfileCubit>()
                                              .projectIdsChanged([
                                              ...state.projectIds.value,
                                              project.name
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

class _InterestIdsInput extends StatefulWidget {
  final bool isEditing;
  final List<String> interestIds;

  _InterestIdsInput(this.isEditing, this.interestIds);
  @override
  __InterestIdsInputState createState() => __InterestIdsInputState();
}

class __InterestIdsInputState extends State<_InterestIdsInput> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
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
                      labelText: 'Type an interest..',
                      hintText: 'Type an interest...'),
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
                                              .bloc<AddProfileCubit>()
                                              .interestIdsChanged(
                                                  [interest.interest])
                                          : context
                                              .bloc<AddProfileCubit>()
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

class _SubmitButton extends StatelessWidget {
  final Function editState;

  _SubmitButton(this.editState);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProfileCubit, AddProfileState>(
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
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: state.status.isValidated
                    ? () {
                        /*context
                            .bloc<AddProfileCubit>()
                            .addProfileFormSubmitted();*/
                        context.bloc<ProfilesCubit>().updateProfile(
                              
                                first: state.first.value,
                                last: state.last.value,
                                email: state.email.value,
                                bio: state.bio.value,
                                title: state.title.value,
                                picture: state.picture.value,
                                interestIds: state.interestIds.value,
                                projectIds: state.projectIds.value,
                              
                            );
                        context.bloc<InterestsCubit>().profileUpdatedInterests(
                          state.email.value,
                          state.interestIds.value,
                        );
                        editState();
                      }
                    : null,
              );
      },
    );
  }
}
