import 'package:bowfolio/bloc/authentication/authentication_bloc.dart';
import 'package:bowfolio/bloc/interests/interests_cubit.dart';
import 'package:bowfolio/bloc/interests/interests_state.dart';
import 'package:bowfolio/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';

typedef OnSaveCallback = Function(
    String first,
    String last,
    String email,
    String bio,
    String title,
    String picture,
    List<String> interestIds,
    List<String> projectIds);

class AddEditProfile extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Profile profile;
  final String email;

  AddEditProfile(
      {Key key,
      @required this.onSave,
      @required this.isEditing,
      this.profile,
      this.email})
      : super(key: key ?? Keys.addProfile);

  @override
  _AddEditProjectPageState createState() => _AddEditProjectPageState();
}

class _AddEditProjectPageState extends State<AddEditProfile> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _first;
  String _last;
  String _bio;
  String _picture;
  String _title;
  List<String> _interestIds;
  List<String> _projectIds;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(isEditing ? widget.profile.email : widget.email),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: isEditing ? widget.profile.first : '',
                    autofocus: !isEditing,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (val) {
                      return val.trim().isEmpty ? 'empty' : null;
                    },
                    onSaved: (value) => _first = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: isEditing ? widget.profile.last : '',
                    autofocus: !isEditing,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (val) {
                      return val.trim().isEmpty ? 'empty' : null;
                    },
                    onSaved: (value) => _last = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: isEditing ? widget.profile.bio : '',
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    autofocus: !isEditing,
                    decoration:
                        InputDecoration(labelText: 'Biographical Statement'),
                    validator: (val) {
                      return val.trim().isEmpty ? 'empty' : null;
                    },
                    onSaved: (value) => _bio = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: isEditing ? widget.profile.picture : '',
                    autofocus: !isEditing,
                    decoration: InputDecoration(labelText: 'Picture Url'),
                    validator: (val) {
                      return val.trim().isEmpty ? 'empty' : null;
                    },
                    onSaved: (value) => _picture = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: isEditing ? widget.profile.title : '',
                    autofocus: !isEditing,
                    decoration: InputDecoration(labelText: 'title'),
                    validator: (val) {
                      return val.trim().isEmpty ? 'empty' : null;
                    },
                    onSaved: (value) => _title = value,
                  ),
                ),
                /*InterestsField(
                  isEditing: isEditing,
                  interestIds: isEditing ? widget.profile.interestIds : [''],
                  onSaved: (ids) => _interestIds = ids,
                ),*/
                Padding(
                  padding: const EdgeInsets.only(left:80.0, right: 80.0),
                  child: RaisedButton(
                    child: const Text(
                      'Save Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        widget.onSave(
                          _first,
                          _last,
                          widget.email,
                          _bio,
                          _title,
                          _picture,
                          widget.profile.interestIds, //_interestIds,
                          widget.profile.projectIds, //_projectIds,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*class InterestsField extends StatefulWidget {
  final bool isEditing;
  final Function onSaved;
  final List<String> interestIds;

  InterestsField({
    @required this.isEditing,
    @required this.onSaved,
    this.interestIds,
  });

  @override
  _InterestsFieldState createState() => _InterestsFieldState();
}

class _InterestsFieldState extends State<InterestsField> {
  bool get isEditing => widget.isEditing;

  List<String> _interestIds;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: BlocBuilder<InterestsCubit, InterestsState>(
        builder: (context, state) {
          if (state is LoadedState) {
            final interests = state.interests;
            return isEditing
                ? Column(
                    children: [
                      TagInterest(
                        profile: profile
                      }),
                      Container(
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.interestIds.length,
                          itemBuilder: (BuildContext context, int index) {
                            final interest = interests[index];
                            return Text(interest.interest);
                          },
                        ),
                      )
                    ],
                  )
                : Text('no interests');
          } else
            return Container();
        },
      ),
    );
  }
}*/
