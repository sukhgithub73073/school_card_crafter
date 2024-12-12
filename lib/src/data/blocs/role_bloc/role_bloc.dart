import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_storage/hive_storage.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/enums/role_enum.dart';
import 'package:card_craft/src/utility/app_util.dart';

part 'role_event.dart';

part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc() : super(RoleInitial()) {
    on<ChangeRoleEvent>(_doChangeRole);
    on<UpdateRoleEventData>(_updateRoleData);
  }

  FutureOr<void> _doChangeRole(ChangeRoleEvent event, Emitter<RoleState> emit) {
    getHiveStorage.write(key: "CURRENT_ROLE", value: event.roleEnum.name);
    emit(RoleLoading());
    if (event.roleEnum == RoleEnum.SuperAdmin) {
      emit(RoleSuperAdmin());
    }else if (event.roleEnum == RoleEnum.PrinterVendor) {
      emit(RolePrinterVendor());
    }else if (event.roleEnum == RoleEnum.Organization) {
      emit(RoleOrganization());
    }else if (event.roleEnum == RoleEnum.Staff) {
      emit(RoleStaff());
    }else {
      emit(RoleStudent());
    }
  }

  FutureOr<void> _updateRoleData(
      UpdateRoleEventData event, Emitter<RoleState> emit) {
    try {
      emit(RoleLoading());
      if (event.roleEnum == RoleEnum.SuperAdmin) {
        emit(RoleSuperAdmin());
      }else if (event.roleEnum == RoleEnum.PrinterVendor) {
        emit(RolePrinterVendor());
      }else if (event.roleEnum == RoleEnum.Organization) {
        emit(RoleOrganization());
      }else if (event.roleEnum == RoleEnum.Staff) {
        emit(RoleStaff());
      }else {
        emit(RoleStudent());
      }

    } catch (e) {
      printLog(">>>>>>>>>>>>>>>Exception>$e");
    }
  }
}
