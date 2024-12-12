// import 'package:card_craft/src/core/app_assets.dart';
// import 'package:card_craft/src/core/app_colors.dart';
// import 'package:card_craft/src/core/app_image_view.dart';
// import 'package:card_craft/src/core/app_tap_widget.dart';
// import 'package:card_craft/src/core/app_text_style.dart';
// import 'package:card_craft/src/core/common_space.dart';
// import 'package:card_craft/src/core/text_view.dart';
// import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
// import 'package:card_craft/src/enums/role_enum.dart';
// import 'package:card_craft/src/extension/app_extension.dart';
// import 'package:card_craft/src/ui/login/login_screen.dart';
// import 'package:card_craft/src/utility/dialog_util/dialog_util.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class RoleSelectionScreen extends StatefulWidget {
//   const RoleSelectionScreen({super.key});
//
//   @override
//   State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
// }
//
// class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<RoleBloc, RoleState>(
//       listener: (context, state) {
//         if (state is RoleLoading) {
//         } else {
//           context.pushScreen(nextScreen: LoginScreen());
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: Stack(
//             children: [
//               ImageView(
//                   url: AppAssets.topRound,
//                   width: double.maxFinite,
//                   height: 150.h,
//                   fit: BoxFit.fill),
//               ListView(children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 100),
//                   height: 150.h,
//                   width: 150.w,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorSecendry, width: 3.w),
//                       color: colorWhite,
//                       shape: BoxShape.circle),
//                   child: Center(
//                     child: ImageView(
//                       margin: EdgeInsets.all(20.w),
//                       url: AppAssets.logo,
//                       imageType: ImageType.asset,
//                     ),
//                   ),
//                 ),
//                 spaceVertical(space: 20.h),
//                 TextView(
//                   text: "Choose your option",
//                   color: colorPrimary,
//                   textSize: 20.sp,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyleEnum.bold,
//                   fontFamily: Family.bold,
//                   lineHeight: 1.3,
//                 ),
//                 spaceVertical(space: 40.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         TapWidget(
//                           onTap: () {
//                             context.read<RoleBloc>().add(
//                                 ChangeRoleEvent(roleEnum: RoleEnum.student));
//                           },
//                           child: Container(
//                             height: 90.h,
//                             width: 100.w,
//                             decoration: BoxDecoration(
//                                 color: colorPrimary,
//                                 borderRadius: BorderRadius.circular(5.r)),
//                             child: Center(
//                               child: ImageView(
//                                 margin: EdgeInsets.all(15.w),
//                                 url: AppAssets.student,
//                                 imageType: ImageType.asset,
//                               ),
//                             ),
//                           ),
//                         ),
//                         spaceVertical(space: 5.h),
//                         TextView(
//                           text: "Student",
//                           color: colorGray,
//                           textSize: 15.sp,
//                           textAlign: TextAlign.center,
//                           style: AppTextStyleEnum.medium,
//                           fontFamily: Family.medium,
//                           lineHeight: 1.3,
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         TapWidget(
//                           onTap: () {
//                             context.read<RoleBloc>().add(
//                                 ChangeRoleEvent(roleEnum: RoleEnum.Staff));
//                           },
//                           child: Container(
//                             height: 90.h,
//                             width: 100.w,
//                             decoration: BoxDecoration(
//                                 color: colorPrimary,
//                                 borderRadius: BorderRadius.circular(5.r)),
//                             child: Center(
//                               child: ImageView(
//                                 margin: EdgeInsets.all(15.w),
//                                 url: AppAssets.teacher,
//                                 imageType: ImageType.asset,
//                               ),
//                             ),
//                           ),
//                         ),
//                         spaceVertical(space: 5.h),
//                         TextView(
//                           text: "Teacher",
//                           color: colorGray,
//                           textSize: 15.sp,
//                           textAlign: TextAlign.center,
//                           style: AppTextStyleEnum.medium,
//                           fontFamily: Family.medium,
//                           lineHeight: 1.3,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 spaceVertical(space: 20.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         TapWidget(
//                           onTap: () {
//                             context.read<RoleBloc>().add(
//                                 ChangeRoleEvent(roleEnum: RoleEnum.principle));
//                           },
//                           child: Container(
//                             height: 90.h,
//                             width: 100.w,
//                             decoration: BoxDecoration(
//                                 color: colorPrimary,
//                                 borderRadius: BorderRadius.circular(5.r)),
//                             child: Center(
//                               child: ImageView(
//                                 margin: EdgeInsets.all(15.w),
//                                 url: AppAssets.principal,
//                                 imageType: ImageType.asset,
//                               ),
//                             ),
//                           ),
//                         ),
//                         spaceVertical(space: 5.h),
//                         TextView(
//                           text: "Principal",
//                           color: colorGray,
//                           textSize: 15.sp,
//                           textAlign: TextAlign.center,
//                           style: AppTextStyleEnum.medium,
//                           fontFamily: Family.medium,
//                           lineHeight: 1.3,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ]),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
