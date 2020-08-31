class ProfileEntity {
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

  ProfileEntity(
    this.first,
    this.last,
    this.email,
    this.bio,
    this.title,
    this.picture,
    this.interestIds,
    this.projectIds,
  );

  @override
  int get hashCode =>
      first.hashCode ^
      last.hashCode ^
      email.hashCode ^
      bio.hashCode ^
      title.hashCode ^
      picture.hashCode ^
      interestIds.hashCode ^
      projectIds.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileEntity &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          last == other.last &&
          bio == other.bio &&
          title == other.title &&
          picture == other.picture &&
          interestIds == other.interestIds &&
          projectIds == other.projectIds;

  Map<String, Object> toJson() {
    return {
      'first': first,
      'last': last,
      'email': email,
      'bio': bio,
      'title': title,
      'picture': picture,
      'interestIds': interestIds,
      'projectIds': projectIds,
    };
  }

  @override
  String toString() {
    return 'ProfileEntity { first: $first, last: $last, email: $email, bio: $bio, title: $title, picture: $picture, interestIds: $interestIds, projectIds: $projectIds }';
  }

  static ProfileEntity fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      json['first'] as String,
      json['last'] as String,
      json['email'] as String,
      json['bio'] as String,
      json['title'] as String,
      json['picture'] as String,
      List<String>.from(json['interestIds']),
      List<String>.from(json['projectIds']),
    );
  }
}
