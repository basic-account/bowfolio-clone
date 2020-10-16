import 'package:formz/formz.dart';

enum FirstNameValidationError { empty }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure() : super.pure('');
  const FirstName.dirty([String value = '']) : super.dirty(value);

  @override
  FirstNameValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : FirstNameValidationError.empty;
  }
}

enum LastNameValidationError { empty }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure() : super.pure('');
  const LastName.dirty([String value = '']) : super.dirty(value);

  @override
  LastNameValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : LastNameValidationError.empty;
  }
}

enum EmailValidationError { empty }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : EmailValidationError.empty;
  }
}

enum BioValidationError { empty }

class Bio extends FormzInput<String, BioValidationError> {
  const Bio.pure() : super.pure('');
  const Bio.dirty([String value = '']) : super.dirty(value);

  @override
  BioValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : BioValidationError.empty;
  }
}

enum TitleValidationError { empty }

class Title extends FormzInput<String, TitleValidationError> {
  const Title.pure() : super.pure('');
  const Title.dirty([String value = '']) : super.dirty(value);

  @override
  TitleValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : TitleValidationError.empty;
  }
}

enum PictureValidationError { empty }

class Picture extends FormzInput<String, PictureValidationError> {
  const Picture.pure() : super.pure('');
  const Picture.dirty([String value = '']) : super.dirty(value);

  @override
  PictureValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : PictureValidationError.empty;
  }
}

enum InterestIdsValidationError { empty }

class InterestIds extends FormzInput<List<String>, InterestIdsValidationError> {
  const InterestIds.pure() : super.pure( const ['']);
  const InterestIds.dirty([List<String> values = const ['']]) : super.dirty(values);

  @override
  InterestIdsValidationError validator(List<String> values) {
    return values?.isNotEmpty == true ? null : InterestIdsValidationError.empty;
  }
}

enum ProjectIdsValidationError { empty }

class ProjectIds extends FormzInput<List<String>, ProjectIdsValidationError> {
  const ProjectIds.pure() : super.pure( const ['']);
  const ProjectIds.dirty([List<String> values = const ['']]) : super.dirty(values);

  @override
  ProjectIdsValidationError validator(List<String> values) {
    return values?.isNotEmpty == true ? null : ProjectIdsValidationError.empty;
  }
}