import 'dart:async';

import 'package:meta/meta.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  String email;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _controller.add(AuthenticationStatus.authenticated);
        this.email = email;
      },
    );
  }

  Future<void> signUp({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _controller.add(AuthenticationStatus.authenticated);
        this.email = email;
      },
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
