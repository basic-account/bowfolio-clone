import 'package:bloc/bloc.dart';
import 'package:bowfolio/models/forms_profile.dart';
import 'package:bowfolio/models/profile.dart';
import 'package:bowfolio/repository/profiles/profiles_repository.dart';
import 'package:formz/formz.dart';
import 'add_profile_state.dart';

//part 'add_profile_state.dart';


class AddProfileCubit extends Cubit<AddProfileState> {
  AddProfileCubit(this._profilesRepository, this._isEditing, this._profile)
      : assert(_profilesRepository != null),
        super(const AddProfileState()){
          _initialize(this._profile, this._isEditing);
        }
  
  final ProfilesRepository _profilesRepository;
  final Profile _profile;
  final bool _isEditing;

  void _initialize(Profile profile, bool isEditing) {
    if(isEditing){
      firstNameChanged(profile.first);
      lastNameChanged(profile.last);
      emailChanged(profile.email);
      bioChanged(profile.bio);
      titleChanged(profile.title);
      pictureChanged(profile.picture);
      interestIdsChanged(profile.interestIds);
      projectIdsChanged(profile.projectIds);
    } else {
      emailChanged(profile.email);
    }
  }

  void firstNameChanged(String value) {
    final first = FirstName.dirty(value);
    emit(state.copyWith(
      first: first,
      status: Formz.validate([
        first,
        state.last,
        state.email,
        state.bio,
        state.title,
        state.picture,
        //state.interestIds,
        //state.projectIds
      ]),
    ));
  }

  void lastNameChanged(String value) {
    final last = LastName.dirty(value);
    emit(state.copyWith(
      last: last,
      status: Formz.validate([
        state.first,
        last,
        state.email,
        state.bio,
        state.title,
        state.picture,
        //state.interestIds,
        //state.projectIds
      ]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.first,
        state.last,
        email,
        state.bio,
        state.title,
        state.picture,
        //state.interestIds,
        //state.projectIds
      ]),
    ));
  }

  void bioChanged(String value) {
    final bio = Bio.dirty(value);
    emit(state.copyWith(
      bio: bio,
      status: Formz.validate([
        state.first,
        state.last,
        state.email,
        bio,
        state.title,
        state.picture,
        //state.interestIds,
        //state.projectIds
      ]),
    ));
  }

  void titleChanged(String value) {
    final title = Title.dirty(value);
    emit(state.copyWith(
      title: title,
      status: Formz.validate([
        state.first,
        state.last,
        state.email,
        state.bio,
        title,
        state.picture,
        //state.interestIds,
        //state.projectIds
      ]),
    ));
  }

  void pictureChanged(String value) {
    final picture = Picture.dirty(value);
    emit(state.copyWith(
      picture: picture,
      status: Formz.validate([
        state.first,
        state.last,
        state.email,
        state.bio,
        state.title,
        picture,
        //state.interestIds,
        //state.projectIds
      ]),
    ));
  }

  void interestIdsChanged(List<String> values) {
    final interestIds = InterestIds.dirty(values);
    emit(state.copyWith(
      interestIds: interestIds,
      status: Formz.validate([
        state.first,
        state.last,
        state.email,
        state.bio,
        state.title,
        state.picture,
        interestIds,
        //state.projectIds
      ]),
    ));
  }

  void projectIdsChanged(List<String> values) {
    final projectIds = ProjectIds.dirty(values);
    emit(state.copyWith(
      projectIds: projectIds,
      status: Formz.validate([
        state.first,
        state.last,
        state.email,
        state.bio,
        state.title,
        state.picture,
        //state.interestIds,
        projectIds
      ]),
    ));
  }

  Future<void> addProfileFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _profilesRepository.addOrUpdateProfile(
        
        first: state.first.value,
        last: state.last.value,
        email: state.email.value,
        bio: state.bio.value,
        title: state.title.value,
        picture: state.picture.value,
        interestIds: state.interestIds.value,
        projectIds: state.projectIds.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
