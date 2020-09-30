import '../../models/interest.dart';

class InterestsRepository {
  //MovieRepository(this.client);

  //final Dio client;

  Future<List<Interest>> getInterests() async {
    try {

      return [
          Interest(
            interest: 'Walking',
            profileIds: ['john@gmail.com', 'email4'],
            projectIds: ['Regular Project'],
          ),
          Interest(
            interest: 'Sitting',
            profileIds: ['john@gmail.com', 'email3'],
            projectIds: ['Regular Project', 'More Walks!!'],
          ),
          Interest(
            interest: 'Dissections',
            profileIds: ['email2'],
            projectIds: ['Storm Area 51'],
          ),
          Interest(
            interest: 'Anatomy',
            profileIds: ['email2'],
            projectIds: [],
          ),
          Interest(
            interest: 'Accounting',
            profileIds: ['email3'],
            projectIds: ['Black Hole Energy Project'],
          ),
          Interest(
            interest: 'Barking',
            profileIds: ['email4'],
            projectIds: ['Storm Area 51', 'More Walks!!'],
          ),
        ];
    } catch (e) {
      throw e;
    }
  }
}