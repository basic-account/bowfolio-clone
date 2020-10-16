import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Profile extends Equatable {
  //First Name
  final String first;
  //Last Name
  final String last;
  //Email Address; primary key
  final String email;
  //biography
  final String bio;
  //Teacher, Scientist, etc..
  final String title;
  //profile picture
  final String picture;
  final List<String> interestIds;
  final List<String> projectIds;

  Profile({
    String first,
    String last,
    @required this.email,
    String bio,
    String title,
    String picture,
    List<String> interestIds,
    List<String> projectIds,
  }) : this.first = first ?? 'g',
       this.last = last ?? 'g',
       this.bio = bio ?? 'g',
       this.title = title ?? 'g',
       this.picture = picture ?? 'g',
       this.interestIds = interestIds ?? ['g'],
       this.projectIds = projectIds ?? ['g'];

  @override
  List<Object> get props =>
      [first, last, email, bio, title, picture, interestIds, projectIds];

  Profile copyWith({
    String first,
    String last,
    String email,
    String bio,
    String title,
    String picture,
    List<String> interestIds,
    List<String> projectIds,
  }) {
    return Profile(
      first: first ?? this.first,
      last: last ?? this.last,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      title: title ?? this.title,
      picture: picture ?? this.picture,
      interestIds: interestIds ?? this.interestIds,
      projectIds: projectIds ?? this.projectIds,
    );
  }

  @override
  String toString() {
    return 'Profile { first: $first, last: $last, email: $email, title: $title, picture: $picture, interestIds: $interestIds, projectIds: $projectIds }';
  }

  /*ProfileEntity toEntity() {
    return ProfileEntity(
      first,
      last,
      email,
      bio,
      title,
      picture,
      //interestIds,
      //projectIds,
    );
  }

  static fromEntity(ProfileEntity entity) {
    return Profile(
      first: entity.first ?? 'John' ,
      last: entity.last ?? 'Doe',
      email: entity.email,
      bio: entity.bio ?? 'bio',
      title: entity.title ?? 'Jobless',
      picture: entity.picture ?? 'fake.jpg',
      //interestIds: entity.interestIds ?? ['none'],
      //projectIds: entity.projectIds ?? ['none'],
    );
  }*/
}
