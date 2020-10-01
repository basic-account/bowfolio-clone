import '../../models/profile.dart';

class ProfilesRepository {

  List<Profile> _profiles = [
    Profile(
      first: 'John',
      last: 'Doe',
      email: 'john@gmail.com',
      bio:
          'Regular human. There is nothing to see behind this thin veil. Move along.',
      title: 'Human',
      picture:
          'https://1.bp.blogspot.com/-YD3tUFLWcHs/UN1E-NSi4II/AAAAAAAAAYI/wpzBlIhlqGU/s1600/IMG_3473.jpg',
      interestIds: ['Walking', 'Sitting'],
      projectIds: ['Regular Project'],
    ),
    Profile(
      first: 'Ayy',
      last: 'Lmao',
      email: 'email2',
      bio: 'Just a fun alien looking for some fun alien times',
      title: 'Navigator',
      picture: 'https://i.ytimg.com/vi/epSv2k8ap4M/maxresdefault.jpg',
      interestIds: ['Dissections', 'Anatomy'],
      projectIds: ['Storm Area 51', 'Black Hole Energy Project'],
    ),
    Profile(
      first: 'Jake',
      last: 'From Accounting',
      email: 'email3',
      bio:
          'You will probably forget about me before you finish reading my profile.',
      title: 'Accountant',
      picture: 'https://miro.medium.com/max/1000/1*vKR5y-ZK1IL6ihOd9qOHJw.png',
      interestIds: ['Accounting', 'Sitting'],
      projectIds: ['Regular Project', 'Black Hole Energy Project'],
    ),
    Profile(
      first: 'Buddy',
      last: 'The Pup',
      email: 'email4',
      bio: 'Woof, Woof, Bark bark. *wimper?*',
      title: 'The Goodest',
      picture:
          'https://socialnewsdaily.com/wp-content/uploads/2018/07/dog-having-a-good-day.jpg',
      interestIds: ['Barking', 'Walking'],
      projectIds: ['Regular Project', 'More Walks!!'],
    ),
  ];

  Future<List<Profile>> getProfiles() async {
    try {
      return _profiles;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Profile>> updateProfile(Profile profile) async {
    try {
      int index =  _profiles.indexWhere((element) => element.email == profile.email);
      _profiles.replaceRange(index, index + 1, [profile]);
      return _profiles;
    } catch (e) {
      throw e;
    }
  }
}
