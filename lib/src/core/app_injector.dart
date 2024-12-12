import 'dart:async';

import 'package:card_craft/src/data/repository/classes_repo.dart';
import 'package:card_craft/src/data/repository/groups_repo.dart';
import 'package:card_craft/src/data/repository/pincode_repo.dart';
import 'package:card_craft/src/data/repository/school_repo.dart';
import 'package:card_craft/src/data/repository/student_repo.dart';
import 'package:card_craft/src/data/repository/subject_repo.dart';
import 'package:card_craft/src/data/repository/teacher_repo.dart';
import 'package:flutter/material.dart';

import 'package:card_craft/src/data/repository/login%20_repo.dart';
import 'package:card_craft/src/data/repository/product_repo.dart';
import 'package:card_craft/src/data/repository/register_repo.dart';
import 'package:get_it/get_it.dart';
typedef AppRunner = FutureOr<void> Function();

class AppInjector {
  static Future<void> init({
    required AppRunner appRunner,
  }) async {
    await _initDependencies();
    appRunner();
  }

  static Future<void> _initDependencies() async {
    await GetIt.I.allReady();
    GetIt.I.registerSingleton<LoginRepository>(LoginRepositoryImp());
    GetIt.I.registerSingleton<RegisterRepository>(RegisterRepositoryImp());
    GetIt.I.registerSingleton<SchoolRepository>(SchoolRepositoryImp());
    GetIt.I.registerSingleton<PincodeRepository>(PincodeRepositoryImp());
    GetIt.I.registerSingleton<GroupsRepository>(GroupsRepositoryImp());
    GetIt.I.registerSingleton<ClassesRepository>(ClassesRepositoryImp());
    GetIt.I.registerSingleton<TeacherRepository>(TeacherRepositoryImp());
    GetIt.I.registerSingleton<StudentRepository>(StudentRepositoryImp());
    GetIt.I.registerSingleton<SubjectRepository>(SubjectRepositoryImp());

    GetIt.I.registerSingleton<ProductRepository>(ProductRepositoryImp());
    GetIt.I.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

  }
}