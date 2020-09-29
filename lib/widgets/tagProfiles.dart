import 'package:bowfolio/bloc/profiles/profiles_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'filtered_profiles_select.dart';

class TagProfiles extends StatefulWidget {
  @override
  _TagProfilesState createState() => _TagProfilesState();
}

class _TagProfilesState extends State<TagProfiles> {
  String _searchTerm = '';
  List<String> _profileIDs;

  Widget filteredList(List<String> profileIds) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: '',
          decoration: InputDecoration(hintText: 'Profiles...'),
          validator: (val) {
            return val.trim().isEmpty ? 'empty' : null;
          },
          onChanged: (value) {
            //_searchTerm = value;
            context.bloc<ProfilesSearchCubit>().filter(value);
          },
          onSaved: (value) => context.bloc<ProfilesSearchCubit>().filter(value),
        ),
        Container(height: 100, child: FilteredProfilesSelect(_searchTerm)),
      ],
    );
  }
}
