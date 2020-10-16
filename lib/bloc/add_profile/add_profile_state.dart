//part of 'add_profile_cubit.dart';

import 'package:bowfolio/models/forms_profile.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AddProfileState extends Equatable {
  const AddProfileState({
    this.first = const FirstName.pure(),
    this.last = const LastName.pure(),
    this.email = const Email.pure(),
    this.bio = const Bio.pure(),
    this.title = const Title.pure(),
    this.picture = const Picture.pure(),
    this.interestIds = const InterestIds.pure(),
    this.projectIds = const ProjectIds.pure(),
    this.status = FormzStatus.pure,
  });

  final FirstName first;
  final LastName last;
  final Email email;
  final Bio bio;
  final Picture picture;
  final Title title;
  final InterestIds interestIds;
  final ProjectIds projectIds;
  final FormzStatus status;

  @override
  List<Object> get props => [first, last, email, bio, title,  picture, interestIds, projectIds, status];

  AddProfileState copyWith({
  FirstName first,
  LastName last,
  Email email,
  Bio bio,
  Title title,
  Picture picture,
  InterestIds interestIds,
  ProjectIds projectIds,
  FormzStatus status,
  }) {
    return AddProfileState(
      first: first ?? this.first,
      last: last ?? this.last,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      title: title ?? this.title,
      picture: picture ?? this.picture,
      interestIds: interestIds ?? this.interestIds,
      projectIds: projectIds ?? this.projectIds,
      status: status ?? this.status,
    );
  }
}