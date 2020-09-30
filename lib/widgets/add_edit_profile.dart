import 'package:bowfolio/models/profile.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

typedef OnSaveCallback = Function(String name, String picture, String homepage,
    String description, List<String> interestIds, List<String> profileIds);

class AddEditProfile extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Profile profile;
  final String email;

  AddEditProfile(
      {Key key, @required this.onSave, @required this.isEditing, this.profile, this.email})
      : super(key: key ?? Keys.addProfile);

  @override
  _AddEditProjectPageState createState() => _AddEditProjectPageState();
}

class _AddEditProjectPageState extends State<AddEditProfile> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _first;
  String _last;
  String _email;
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
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text(isEditing? widget.profile.email : widget.email),
            TextFormField(
              initialValue: isEditing ? widget.profile.first : '',
              autofocus: !isEditing,
              decoration: InputDecoration(hintText: 'First Name...'),
              validator: (val) {
                return val.trim().isEmpty ? 'empty' : null;
              },
              onSaved: (value) => _first = value,
            ),
            TextFormField(
              initialValue: isEditing ? widget.profile.last : '',
              autofocus: !isEditing,
              decoration: InputDecoration(hintText: 'Last Name...'),
              validator: (val) {
                return val.trim().isEmpty ? 'empty' : null;
              },
              onSaved: (value) => _last = value,
            ),
            TextFormField(
              initialValue: isEditing ? widget.profile.bio : '',
              autofocus: !isEditing,
              decoration:
                  InputDecoration(hintText: 'Biographical Statement...'),
              validator: (val) {
                return val.trim().isEmpty ? 'empty' : null;
              },
              onSaved: (value) => _bio = value,
            ),
            TextFormField(
              initialValue: isEditing ? widget.profile.picture : '',
              autofocus: !isEditing,
              decoration: InputDecoration(hintText: 'Picture Url...'),
              validator: (val) {
                return val.trim().isEmpty ? 'empty' : null;
              },
              onSaved: (value) => _picture = value,
            ),
            TextFormField(
              initialValue: isEditing ? widget.profile.title : '',
              autofocus: !isEditing,
              decoration: InputDecoration(hintText: 'Project Name...'),
              validator: (val) {
                return val.trim().isEmpty ? 'empty' : null;
              },
              onSaved: (value) => _title = value,
            ),
          ],
        ),
      ),
    );
  }
}
