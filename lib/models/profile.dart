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
    this.first,
    this.last,
    @required this.email,
    this.bio,
    this.title,
    this.picture,
    this.interestIds,
    this.projectIds,
    String id,
  });

  @override
  List<Object> get props =>
      [first, last, email, bio, title, picture, interestIds, projectIds];

}