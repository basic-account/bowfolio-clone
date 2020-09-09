import 'dart:async';

import 'package:bowfolio/repository/profiles/profile_entity.dart';
import 'package:bowfolio/repository/profiles/profiles_repository.dart';
//TODO real impl
class ProfilesWebClient implements ProfilesRepository {
  final Duration delay;

  const ProfilesWebClient([this.delay = const Duration(milliseconds: 3000)]);

  @override
  Future<List<ProfileEntity>> loadProfiles() async {
    print('in web');
    return Future.delayed(
      delay,
      () => [
          ProfileEntity(
            'first',
            'last',
            '1',
            'bio',
            'title',
            'picture',
            //['interest 1', 'interest 2'],
            //['project 1', 'project 2'],
          ),
          /*ProfileEntity(
            'first2',
            'last2',
            'email2',
            'bio2',
            'title2',
            'picture2',
            //['interest 1', 'interest 2'],
            //['project 1', 'project 2'],
          ),*/
        ]);
  }

  @override
  Future<bool> saveProfiles(List<ProfileEntity> profiles) async {
    //TODO
    return Future.value(true);
  }
}
