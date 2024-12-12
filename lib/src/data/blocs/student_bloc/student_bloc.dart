import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/models/students_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/repository/student_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:card_craft/src/utility/app_data.dart';

part 'student_event.dart';

part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  var studentRepository = GetIt.I<StudentRepository>();

  StudentBloc() : super(StudentInitial()) {
    on<GetStudentEvent>(_getStudentApi);
    on<LoadMoreStudentEvent>(_loadMoreStudentApi);
    on<ClearStudentEvent>(_clearStudentApi);
    on<SearchStudentEvent>(_searchStudentApi);
    on<CreateStudentEvent>(_createStudentApi);
    on<DeleteStudentEvent>(_deleteStudentApi);
  }

  Future<FutureOr<void>> _getStudentApi(
      GetStudentEvent event, Emitter<StudentState> emit) async {
    try {
      emit(StudentGetLoading());
      var responseModel = await studentRepository.getStudentApi(event.map);
      emit(StudentGetLoadingDismiss());
      StudentsModel studentsModel =
          StudentsModel.fromJson(responseModel.toJson());

      AppData.studentList.addAll(studentsModel.data);
      emit(StudentGetSuccess(
          studentsModel: studentsModel,
          loadMore: studentsModel.data.length == 20));
    } catch (e, t) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>$t");
      emit(StudentGetError(error: e.toString()));
    }
  }

  FutureOr<void> _loadMoreStudentApi(
      LoadMoreStudentEvent event, Emitter<StudentState> emit) async {
    try {
      if (state is! StudentGetSuccess) return;
      final cast = state as StudentGetSuccess;
      List<Datum> list = cast.studentsModel.data ?? <Datum>[];
      var responseModel = await studentRepository.getStudentApi(event.map);
      StudentsModel studentsModel =
      StudentsModel.fromJson(responseModel.toJson());
      list.addAll(studentsModel.data);
      emit(StudentGetSuccess(
          studentsModel: studentsModel.copyWith(data: list),
          loadMore: studentsModel.data.length == 20));
    } catch (e, t) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>$t");
      emit(StudentGetError(error: e.toString()));
    }
  }

  Future<FutureOr<void>> _searchStudentApi(
      SearchStudentEvent event, Emitter<StudentState> emit) async {
    try {
      emit(StudentGetLoading());
      var responseModel = await studentRepository.getStudentApi(event.map);
      emit(StudentGetLoadingDismiss());
      // StudentsModel studentsModel =
      //     StudentsModel.fromJson(responseModel.data["students"]);
      StudentsModel studentsModel =
      StudentsModel.fromJson(responseModel.toJson());
      AppData.studentList.addAll(studentsModel.data);
      emit(StudentGetSuccess(
          studentsModel: studentsModel,
          loadMore: studentsModel.data.length == 20));
    } catch (e, t) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>$t");
      emit(StudentGetError(error: e.toString()));
    }
    //
    //
    // try {
    //   emit(StudentGetLoading());
    //   var filterList = AppData.studentList
    //       .where(
    //         (element) => element.name.contains(event.map["query"]),
    //       )
    //       .toList();
    //   StudentsModel studentsModel = StudentsModel(data: filterList);
    //
    //   emit(StudentGetLoadingDismiss());
    //   emit(StudentGetSuccess(
    //       studentsModel: studentsModel, loadMore: filterList.length == 20));
    // } catch (e, t) {
    //   print(">>>>>>>>>>>>>>>>>>>>>>>>$t");
    //   emit(StudentGetError(error: e.toString()));
    // }
  }

  Future<FutureOr<void>> _createStudentApi(
      CreateStudentEvent event, Emitter<StudentState> emit) async {
    try {
      emit(StudentCreateLoading());
      var responseModel = await studentRepository.createClassApi(event.map);
      emit(StudentCreateLoadingDismiss());
      if (responseModel.success) {
        emit(StudentCreateSuccess(responseModel: responseModel));
      } else {
        emit(StudentCreateError(error: responseModel.message));
      }
    } catch (e) {
      emit(StudentCreateError(error: e.toString()));
    }
  }

  FutureOr<void> _clearStudentApi(
      ClearStudentEvent event, Emitter<StudentState> emit) {
    emit(StudentCreateLoading());
    StudentsModel studentsModel = StudentsModel(data: []);

    emit(StudentGetSuccess(studentsModel: studentsModel, loadMore: false));
  }

  FutureOr<void> _deleteStudentApi(
      DeleteStudentEvent event, Emitter<StudentState> emit) async {
    try {
      if (state is! StudentGetSuccess) return;
      final cast = state as StudentGetSuccess;
      List<Datum> list = cast.studentsModel.data ?? <Datum>[];
      list.removeWhere(
        (element) => element.id == event.map["studentIds"],
      );
      var responseModel = await studentRepository.deleteStudentApi(event.map);
      StudentsModel studentsModel = StudentsModel(data: list);
      emit(StudentGetSuccess(
          studentsModel: studentsModel.copyWith(data: list),
          loadMore: studentsModel.data.length == 20));
    } catch (e, t) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>$t");
      emit(StudentGetError(error: e.toString()));
    }
  }
}
