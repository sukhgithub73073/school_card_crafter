import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

//BuildContext get globalBuildContext =>navigatorKey.currentContext!;

BuildContext get globalBuildContext =>
    GetIt.I.get<GlobalKey<NavigatorState>>().currentContext!;

bool get globalBuildContextExist =>
    GetIt.I.get<GlobalKey<NavigatorState>>().currentContext != null;
