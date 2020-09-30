import '../../models/project.dart';

class ProjectsRepository {
  //MovieRepository(this.client);

  //final Dio client;

  Future<List<Project>> getProjects() async {
    try {

      return [
          Project(
            name: 'Regular Project',
            picture: 'https://media.istockphoto.com/vectors/man-vector-icon-gender-icon-vector-id1132067376?k=6&m=1132067376&s=612x612&w=0&h=BUCm8AwVk5yoZnW6M5JWy2NLbN93NwFL1Rm8n69pwvw=',
            homepage: 'homepage',
            description: 'Nothing to see here..',
            interestIds: ['Walking', 'Sitting'],
            profileIds: ['john@gmail.com', 'email3', 'email4'],
          ),
          Project(
            name: 'Storm Area 51',
            picture: 'https://cdn4.iconfinder.com/data/icons/proglyphs-traveling/512/Ufo-512.png',
            homepage: 'homepage',
            description: 'We Need To Find Out Whats Going On There, For Real',
            interestIds: ['Dissections', 'Barking'],
            profileIds: ['email2'],
          ),
          Project(
            name: 'Black Hole Energy Project',
            picture: 'http://aux4.iconspalace.com/uploads/951741771.png',
            homepage: 'homepage',
            description: 'Small startup based on harnessing dark energy. Should only take a few months to get this one off the ground.',
            interestIds: ['Accounting'],
            profileIds: ['email2', 'email3'],
          ),
          Project(
            name: 'More Walks!!',
            picture: 'https://image.flaticon.com/icons/png/512/75/75195.png',
            homepage: 'homepage',
            description: 'The Good Dog for Good Human Scheme. Both sides make concessions to achieve walk prosperity. In barkese: Woof, Woof, Bark, Woof, *sniff*',
            interestIds: ['Sitting', 'More Walks!!'],
            profileIds: ['email4'],
          ),
        ];
    } catch (e) {
      throw e;
    }
  }
}