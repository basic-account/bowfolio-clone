import '../../models/interest.dart';

class InterestsRepository {
  //MovieRepository(this.client);

  //final Dio client;

  Future<List<Interest>> getInterests() async {
    try {

      return [
          Interest(
            interest: 'interest 1',
            profileIds: ['email1', 'email2'],
            projectIds: ['project 1', 'project 2'],
          ),
          Interest(
            interest: 'interest 2',
            profileIds: ['email1', 'email2'],
            projectIds: ['project 1', 'project 2'],
          ),
        ];
    } catch (e) {
      throw e;
    }
  }
}