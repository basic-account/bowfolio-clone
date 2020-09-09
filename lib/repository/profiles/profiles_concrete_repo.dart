import 'package:meta/meta.dart';

import '../../repository/profiles/profiles_web_client.dart';
import '../../repository/profiles/profile_entity.dart';
import '../../repository/profiles/profiles_repository.dart';

class ProfilesConcreteRepository implements ProfilesRepository {
  final ProfilesRepository localStorage;
  final ProfilesRepository webClient;

  const ProfilesConcreteRepository({
    @required this.localStorage,
    this.webClient = const ProfilesWebClient(),
  });

  @override
  Future<List<ProfileEntity>> loadProfiles() async {
    try {
      print('here');
      return await localStorage.loadProfiles();
    } catch (e) {
      final profiles = await webClient.loadProfiles();
      print('couldnt load local');
      await localStorage.saveProfiles(profiles);
      print('saved?');

      return profiles;
    }
  }

  @override
  Future saveProfiles(List<ProfileEntity> profiles) {
    return Future.wait<dynamic>([
      localStorage.saveProfiles(profiles),
      webClient.saveProfiles(profiles),
    ]);
  }
}
