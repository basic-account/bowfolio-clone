import 'package:formz/formz.dart';

enum UsernameValidationError { empty }

class Email extends FormzInput<String, UsernameValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  UsernameValidationError validator(String value) {
    return _emailRegExp.hasMatch(value) == true ? null : UsernameValidationError.empty;
  }
}
