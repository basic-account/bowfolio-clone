import 'package:bowfolio/repository/profiles/profile_entity.dart';
import 'package:bowfolio/repository/profiles/profiles_repository.dart';
//TODO real impl
class ProfilesWebClient implements ProfilesRepository {
  const ProfilesWebClient();
  @override
  Future<List<ProfileEntity>> loadProfiles() async {
    return Future(() => [
          ProfileEntity(
            'first',
            'last',
            'email',
            'bio',
            'title',
            'picture',
            ['interest 1', 'interest 2'],
            ['project 1', 'project 2'],
          ),
          ProfileEntity(
            'first2',
            'last',
            'email2',
            'bio',
            'title',
            'picture',
            ['interest 1', 'interest 2'],
            ['project 1', 'project 2'],
          ),
        ]);
  }

  @override
  Future<bool> saveProfiles(List<ProfileEntity> profiles) async {
    //TODO
    return Future.value(true);
  }
}
