import 'package:flutter/material.dart';

import '../models/profile.dart';
import 'project_image.dart';

class ProfileItem extends StatelessWidget {
  final Profile profile;

  ProfileItem({
    @required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10.0),
              title: Text(
                profile.first + ' ' + profile.last,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                profile.title,
              ),
              trailing: Container(
                height: 40,
                width: 40,
                child: Container(
                  child: FadeInImage(
                    image: NetworkImage(profile.picture),
                    placeholder: NetworkImage(
                        'https://socialnewsdaily.com/wp-content/uploads/2018/07/dog-having-a-good-day.jpg'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                height: 70,
                alignment: Alignment.topLeft,
                child: Text(profile.bio),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profile.interestIds.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          profile.interestIds[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('Projects'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profile.projectIds.length,
                  itemBuilder: (context, index) {
                    return ProjectImage(projectId: profile.projectIds[index]);
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
