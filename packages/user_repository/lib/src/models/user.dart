import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}
