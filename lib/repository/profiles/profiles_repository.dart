import '../../models/profile.dart';

class ProfileRepository {
  //MovieRepository(this.client);

  //final Dio client;

  Future<List<Profile>> getProfiles() async {
    try {

      return [
          Profile(
            first: 'first',
            last: 'last',
            email: '1',
            bio: 'bio',
            title: 'title',
            picture: 'picture',
            //['interest 1', 'interest 2'],
            //['project 1', 'project 2'],
          ),
          Profile(
            first: 'first2',
            last: 'last2',
            email: 'email2',
            bio: 'bio2',
            title: 'title2',
            picture: 'picture2',
            //['interest 1', 'interest 2'],
            //['project 1', 'project 2'],
          ),
        ];
    } catch (e) {
      throw e;
    }
  }
}