import '../../models/project.dart';

class ProjectsRepository {
  //MovieRepository(this.client);

  //final Dio client;

  Future<List<Project>> getProjects() async {
    try {

      return [
          Project(
            name: 'name1',
            picture: 'picture',
            homepage: 'homepage',
            description: 'description',
            interestIds: ['interest 1', 'interest 2'],
            profileIds: ['email1', 'email2'],
          ),
          Project(
            name: 'name2',
            picture: 'picture',
            homepage: 'homepage',
            description: 'description',
            interestIds: ['interest 1', 'interest 2'],
            profileIds: ['email1', 'email2'],
          ),
        ];
    } catch (e) {
      throw e;
    }
  }
}