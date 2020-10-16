import '../../models/interest.dart';

class InterestsRepository {
  List<Interest> _interests = [
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

  Future<List<Interest>> getInterests() async {
    try {
      return _interests;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Interest>> profileUpdatedInterests(
      String email, List<String> interestIds) async {
    try {
      for (int i = 0; i < interestIds.length; i++) {
        int interestIndex = _interests
            .indexWhere((interest) => interest.interest == interestIds[i]);
        Interest interest = _interests[interestIndex];
        if (!interest.profileIds.contains(email)) {
          interest.profileIds.add(email);
          _interests.replaceRange(interestIndex, interestIndex + 1, [interest]);
        }
      }
      return _interests;
    } catch (e) {
      throw e;
    }
  }
}
