import '../../models/profile.dart';

class ProfilesRepository {
  //MovieRepository(this.client);

  //final Dio client;

  Future<List<Profile>> getProfiles() async {
    try {

      return [
          Profile(
            first: 'first',
            last: 'last',
            email: 'email1',
            bio: 'bio',
            title: 'title',
            picture: 'https://picsum.photos/250?image=9',
            interestIds: ['interest 1', 'interest 2'],
            projectIds: ['name1', 'name1'],
          ),
          Profile(
            first: 'Ayy',
            last: 'Buddy',
            email: 'email2',
            bio: 'Just a fun alien looking for some fun alien times',
            title: 'Navigator',
            picture: 'https://i.ytimg.com/vi/epSv2k8ap4M/maxresdefault.jpg',
            interestIds: ['interest 1', 'interest 2'],
            projectIds: ['name1', 'name2'],
          ),
        ];
    } catch (e) {
      throw e;
    }
  }
}