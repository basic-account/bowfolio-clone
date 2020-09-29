import 'package:bowfolio/bloc/profiles/profiles_cubit.dart';
import 'package:bowfolio/bloc/profiles/profiles_search_cubit.dart';
import 'package:bowfolio/widgets/tagProfiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/project.dart';
import '../utils/utils.dart';

typedef OnSaveCallback = Function(String name, String picture, String homepage,
    String description, List<String> interestIds, List<String> profileIds);

class AddEditProject extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Project project;

  AddEditProject(
      {Key key, @required this.onSave, @required this.isEditing, this.project})
      : super(key: key ?? Keys.addProject);

  @override
  _AddEditProjectPageState createState() => _AddEditProjectPageState();
}

class _AddEditProjectPageState extends State<AddEditProject> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _picture;
  String _homepage;
  String _description;
  List<String> _interestIds;
  List<String> _profileIds;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return 
           Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: isEditing ? widget.project.name : '',
                autofocus: !isEditing,
                decoration: InputDecoration(hintText: 'Project Name...'),
                validator: (val) {
                  return val.trim().isEmpty ? 'empty' : null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.project.picture : '',
                autofocus: !isEditing,
                decoration: InputDecoration(hintText: 'Picture url...'),
                validator: (val) {
                  return val.trim().isEmpty ? 'empty' : null;
                },
                onSaved: (value) => _picture = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.project.homepage : '',
                autofocus: !isEditing,
                decoration: InputDecoration(hintText: 'Homepage url...'),
                validator: (val) {
                  return val.trim().isEmpty ? 'empty' : null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.project.description : '',
                autofocus: !isEditing,
                decoration: InputDecoration(hintText: 'description...'),
                validator: (val) {
                  return val.trim().isEmpty ? 'empty' : null;
                },
                onSaved: (value) => _description = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.project.profileIds : '',
                autofocus: !isEditing,
                decoration: InputDecoration(hintText: 'Project Name...'),
                validator: (val) {
                  return val.trim().isEmpty ? 'empty' : null;
                },
                onSaved: (value) => _name = value,
              ),
              TagProfiles(),

            ],
          ),
        ),
      
    );
  }
}
