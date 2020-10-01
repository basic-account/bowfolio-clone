part of 'add_project_cubit.dart';

class AddProjectState extends Equatable {
  const AddProjectState({
    this.name = const Name.pure(),
    this.picture = const Picture.pure(),
    this.homepage = const Homepage.pure(),
    this.description = const Description.pure(),
    this.interestIds = const InterestIds.pure(),
    this.profileIds = const ProfileIds.pure(),
    this.status = FormzStatus.pure,
  });

  final Name name;
  final Picture picture;
  final Homepage homepage;
  final Description description;
  final InterestIds interestIds;
  final ProfileIds profileIds;
  final FormzStatus status;

  @override
  List<Object> get props => [name, picture, homepage, description, interestIds, profileIds, status];

  AddProjectState copyWith({
  Name name,
  Picture picture,
  Homepage homepage,
  Description description,
  InterestIds interestIds,
  ProfileIds profileIds,
  FormzStatus status,
  }) {
    return AddProjectState(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      homepage: homepage ?? this.homepage,
      description: description ?? this.description,
      interestIds: interestIds ?? this.interestIds,
      profileIds: profileIds ?? this.profileIds,
      status: status ?? this.status,
    );
  }
}