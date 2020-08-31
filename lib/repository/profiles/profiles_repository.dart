import 'dart:async';
import 'dart:core';

import 'profile_entity.dart';

abstract class ProfilesRepository {
  Future<List<ProfileEntity>> loadProfiles();

  Future saveProfiles(List<ProfileEntity> profiles);
}