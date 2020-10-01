import 'package:bowfolio/bloc/interests/interests_cubit.dart';
import 'package:bowfolio/bloc/interests/interests_state.dart';
import 'package:bowfolio/bloc/profiles/profiles_cubit.dart';
import 'package:bowfolio/models/profile.dart';
import 'package:bowfolio/widgets/tag_profiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filtered_profiles_select.dart';

class TagInterest extends StatefulWidget {
  final Function onSave;
  final Profile profile;

  TagInterest({
    @required this.onSave,
    @required this.profile,
  });

  @override
  _TagInterestState createState() => _TagInterestState();
}

class _TagInterestState extends State<TagInterest> {
  String _searchTerm = '';


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: '',
          decoration: InputDecoration(hintText: 'Type an interest...'),
          validator: (val) {
            return val.trim().isEmpty ? 'empty' : null;
          },
          onChanged: (value) {
            setState(() {
              _searchTerm = value;
            });
          },
        ),
        BlocBuilder<InterestsCubit, InterestsState>(
          builder: (context, state) {
            if (state is InterestsLoadedState) {
              final interests = state.interests
                  .where((interest) => interest.interest.contains(_searchTerm))
                  .toList();

              return ListView.builder(
                itemCount: interests.length,
                itemBuilder: (BuildContext context, int index) {
                  final interest = interests[index];
                  return FlatButton(
                    child: Text(interest.interest),
                    onPressed: () {
                      context
                          .bloc<ProfilesCubit>()
                          .updateProfile(widget.profile.copyWith(
                            first: widget.profile.first,
                            last: widget.profile.last,
                            email: widget.profile.email,
                            bio: widget.profile.bio,
                            title: widget.profile.title,
                            picture: widget.profile.picture,
                            interestIds:[...widget.profile.interestIds, interest.interest],
                            projectIds: widget.profile.projectIds,
                          ));
                    },
                  );
                },
              );
            } else
              return Container();
          },
        )
      ],
    );
  }
}
