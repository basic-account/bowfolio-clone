import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'profile_entity.dart';
import 'profiles_repository.dart';

class ProfilesFileStorage implements ProfilesRepository {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const ProfilesFileStorage(
    this.tag,
    this.getDirectory,
  );

  @override
  Future<List<ProfileEntity>> loadProfiles() async {
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    final profiles = (json['profiles'])
        .map<ProfileEntity>((profile) => ProfileEntity.fromJson(profile))
        .toList();

    return profiles;
  }

  @override
  Future<File> saveProfiles(List<ProfileEntity> profiles) async {
    final file = await _getLocalFile();
    print('saving to local..');
    return file.writeAsString(JsonEncoder().convert({
      'profiles': profiles.map((profile) => profile.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();
    print('getting local file..');
    return File('${dir.path}/BowfolioAppStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}