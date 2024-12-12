import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:card_craft/src/data/models/group_class_model.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/repository/groups_repo.dart';
import 'package:get_it/get_it.dart';

part 'groups_event.dart';

part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  var groupsRepository = GetIt.I<GroupsRepository>();

  GroupsBloc() : super(GroupsInitial()) {
    on<GetGroupsEvent>(_getGroupsList);
    on<AddGroupsEvent>(_addGroupsList);
  }

  Future<FutureOr<void>> _getGroupsList(
      GetGroupsEvent event, Emitter<GroupsState> emit) async {
    try {
      emit(GroupsLoaderShow());
      var responseModel = await groupsRepository.groupsApi(event.map);
      emit(GroupsLoaderDismiss());
      GroupClassModel groupClassModel = GroupClassModel.fromJson(responseModel.data) ;
      emit(GroupsSuccess(data: groupClassModel.data));
    } catch (e) {
      emit(GroupsError(error: e.toString()));
    }
  }

  Future<FutureOr<void>> _addGroupsList(
      AddGroupsEvent event, Emitter<GroupsState> emit) async {
    try {
      emit(GroupsCreateLoaderShow());
      var responseModel = await groupsRepository.addGroupsApi(event.map);
      emit(GroupsCreateLoaderDissmiss());

      if (responseModel.success) {
       // emit(GroupsSuccess(responseModel: responseModel));
      } else {
        emit(GroupsError(error: responseModel.message));
      }
    } catch (e) {
      emit(GroupsError(error: e.toString()));
    }
  }
}
