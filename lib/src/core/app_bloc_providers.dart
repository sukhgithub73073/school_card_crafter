import 'package:card_craft/src/data/blocs/cast_bloc/cast_bloc.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/detail_bloc/detail_bloc.dart';
import 'package:card_craft/src/data/blocs/disability_bloc/disability_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/image_capture_bloc/image_capture_bloc.dart';
import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:card_craft/src/data/blocs/language_bloc/language_bloc.dart';
import 'package:card_craft/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:card_craft/src/data/blocs/student_bloc/student_bloc.dart';
import 'package:card_craft/src/data/blocs/subject_bloc/subject_bloc.dart';
import 'package:card_craft/src/data/blocs/teacher_bloc/teacher_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:card_craft/src/data/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_craft/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:card_craft/src/data/blocs/product_bloc/product_bloc.dart';
import 'package:card_craft/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:hive_storage/hive_storage.dart';
import 'package:card_craft/src/data/blocs/update_bloc/update_bloc.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;
  final bool lazy;

  const AppBlocProvider({
    Key? key,
    required this.child,
    this.lazy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: lazy, create: (_) => DashboardBloc()..add(DoLoadList())),
        BlocProvider(lazy: lazy, create: (_) => RoleBloc()),
        BlocProvider(lazy: lazy, create: (_) => LoginBloc()),
        BlocProvider(lazy: lazy, create: (_) => DetailBloc()),
        BlocProvider(lazy: lazy, create: (_) => RegisterBloc()),
        BlocProvider(lazy: lazy, create: (_) => PincodeBloc()),
        BlocProvider(lazy: lazy, create: (_) => GroupsBloc()),
        BlocProvider(lazy: lazy, create: (_) => ClassesBloc()),
        BlocProvider(lazy: lazy, create: (_) => TeacherBloc()),
        BlocProvider(lazy: lazy, create: (_) => StudentBloc()),
        BlocProvider(lazy: lazy, create: (_) => SubjectBloc()),
        BlocProvider(lazy: lazy, create: (_) => ImagePickBloc()),
        BlocProvider(lazy: lazy, create: (_) => CastBloc()),
        BlocProvider(lazy: lazy, create: (_) => UpdateBloc()),
        BlocProvider(lazy: lazy, create: (_) => ImageCaptureBloc()),
        BlocProvider(lazy: lazy, create: (_) => DisabilityBloc()),
        BlocProvider(lazy: lazy, create: (_) => LanguageBloc()..add(ChangeLanguageEvent(locale: "en"))) ,


        BlocProvider(
            lazy: lazy,
            create: (_) => ProductBloc()..add(GetProductEvent(map: {}))),
      ],
      child: child,
    );
  }
}
