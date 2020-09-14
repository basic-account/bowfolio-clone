import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Project extends Equatable {
  final String name;
  final String picture;
  final String homepage;
  final String description;
  final List<String> interestIds;
  final List<String> profileIds;

  Project({
    @required this.name,
    String picture,
    String homepage,
    String description,
    List<String> interestIds,
    List<String> profileIds,
  })  : this.picture = picture ?? 'pic',
        this.homepage = homepage ?? 'homepage',
        this.description = description ?? 'description',
        this.interestIds = interestIds ?? ['interest'],
        this.profileIds = profileIds ?? ['profiel'];

  @override
  List<Object> get props =>
      [name, picture, homepage, description, interestIds, profileIds];

  Project copyWith({
    String name,
    String picture,
    String homepage,
    String description,
    List<String> interestIds,
    List<String> profileIds,
  }) {
    return Project(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      homepage: homepage ?? this.homepage,
      description: description ?? this.description,
      interestIds: interestIds ?? this.interestIds,
      profileIds: profileIds ?? this.profileIds,
    );
  }
}
