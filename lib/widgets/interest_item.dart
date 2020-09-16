import 'package:flutter/material.dart';

import '../models/interest.dart';
import 'profile_image.dart';
import 'project_image.dart';

class InterestItem extends StatelessWidget {
  final Interest interest;

  InterestItem({
    @required this.interest,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Container(
                height: 40,
                alignment: Alignment.topLeft,
                child: Text(
                  interest.interest,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Container(
                      width: interest.profileIds.length.toDouble() * 44,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: interest.profileIds.length,
                        itemBuilder: (context, index) {
                          return ProfileImage(
                              profileId: interest.profileIds[index]);
                        },
                      ),
                    ),
                    Container(
                      width: interest.projectIds.length.toDouble() * 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: interest.projectIds.length,
                        itemBuilder: (context, index) {
                          return ProjectImage(
                              projectId: interest.projectIds[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
