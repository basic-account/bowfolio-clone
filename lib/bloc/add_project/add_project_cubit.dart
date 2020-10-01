import 'package:bloc/bloc.dart';
import 'package:bowfolio/models/forms_project.dart';
import 'package:bowfolio/models/project.dart';
import 'package:bowfolio/repository/projects/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit(this._projectsRepository)
      : assert(_projectsRepository != null),
        super(const AddProjectState());

  final ProjectsRepository _projectsRepository;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([
        name,
        state.picture,
        state.homepage,
        state.description,
        state.interestIds,
        state.profileIds
      ]),
    ));
  }

  void pictureChanged(String value) {
    final picture = Picture.dirty(value);
    emit(state.copyWith(
      picture: picture,
      status: Formz.validate([
        state.name,
        picture,
        state.homepage,
        state.description,
        state.interestIds,
        state.profileIds
      ]),
    ));
  }

  void homepageChanged(String value) {
    final homepage = Homepage.dirty(value);
    emit(state.copyWith(
      homepage: homepage,
      status: Formz.validate([
        state.name,
        state.picture,
        homepage,
        state.description,
        state.interestIds,
        state.profileIds
      ]),
    ));
  }

  void descriptionChanged(String value) {
    final description = Description.dirty(value);
    emit(state.copyWith(
      description: description,
      status: Formz.validate([
        state.name,
        state.picture,
        state.homepage,
        description,
        state.interestIds,
        state.profileIds
      ]),
    ));
  }

  void interestIdsChanged(List<String> values) {
    final interestIds = InterestIds.dirty(values);
    emit(state.copyWith(
      interestIds: interestIds,
      status: Formz.validate([
        state.name,
        state.picture,
        state.homepage,
        state.description,
        interestIds,
        state.profileIds
      ]),
    ));
  }

  void profileIdsChanged(List<String> values) {
    final profileIds = ProfileIds.dirty(values);
    emit(state.copyWith(
      profileIds: profileIds,
      status: Formz.validate([
        state.name,
        state.picture,
        state.homepage,
        state.description,
        state.interestIds,
        profileIds
      ]),
    ));
  }

  Future<void> addProjectFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _projectsRepository.addOrUpdateProject(
          project: Project(
        name: state.name.value,
        picture: state.picture.value,
        homepage: state.homepage.value,
        description: state.description.value,
        interestIds: state.interestIds.value,
        profileIds: state.profileIds.value,
      ));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
