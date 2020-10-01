import 'package:formz/formz.dart';

enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : NameValidationError.empty;
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

enum HomepageValidationError { empty }

class Homepage extends FormzInput<String, HomepageValidationError> {
  const Homepage.pure() : super.pure('');
  const Homepage.dirty([String value = '']) : super.dirty(value);

  @override
  HomepageValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : HomepageValidationError.empty;
  }
}

enum DescriptionValidationError { empty }

class Description extends FormzInput<String, DescriptionValidationError> {
  const Description.pure() : super.pure('');
  const Description.dirty([String value = '']) : super.dirty(value);

  @override
  DescriptionValidationError validator(String value) {
    return value?.isNotEmpty == true ? null : DescriptionValidationError.empty;
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

enum ProfileIdsValidationError { empty }

class ProfileIds extends FormzInput<List<String>, ProfileIdsValidationError> {
  const ProfileIds.pure() : super.pure( const ['']);
  const ProfileIds.dirty([List<String> values = const ['']]) : super.dirty(values);

  @override
  ProfileIdsValidationError validator(List<String> values) {
    return values?.isNotEmpty == true ? null : ProfileIdsValidationError.empty;
  }
}