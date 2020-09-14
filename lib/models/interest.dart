import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Interest extends Equatable {
  final String interest;
  final List<String> profileIds;
  final List<String> projectIds;

  Interest({
    @required this.interest,
    List<String> profileIds,
    List<String> projectIds,
  })  : this.profileIds = profileIds ?? ['email1', 'email2'],
        this.projectIds = projectIds ?? ['project1', 'project2'];

  @override
  List<Object> get props => [interest, profileIds];

  Interest copyWith({
    String interest,
    List<String> profileIds,
    List<String> projectIds,
  }) {
    return Interest(
      interest: interest ?? this.interest,
      profileIds: profileIds ?? this.profileIds,
      projectIds: projectIds ?? this.projectIds,
    );
  }
}
