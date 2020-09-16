import 'package:flutter/material.dart';

import '../models/project.dart';
import 'profile_image.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  ProjectItem({
    @required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 275,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(
                project.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(project.picture),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                height: 70,
                alignment: Alignment.topLeft,
                child: Text(project.description),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: project.interestIds.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          project.interestIds[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: project.profileIds.length,
                  itemBuilder: (context, index) {
                    return ProfileImage(profileId: project.profileIds[index]);
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
