import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';
import '../bloc/interests/interests.dart';

class InterestsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterestsCubit, InterestsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return LoadingIndicator();
        } else if (state is LoadedState) {
          final interests = state.interests;
          return ListView.builder(
            itemCount: interests.length,
            itemBuilder: (BuildContext context, int index) {
              final interest = interests[index];
              return Container(
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    Text(interest.interest),
                    Text(interest.profileIds[0]),
                    Text(interest.projectIds.length.toString()),
                  ],
                ),
              );
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
    );
  }
}
