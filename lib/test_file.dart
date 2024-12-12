// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:teach_mate/business_logics/service/all_getter_setter.dart';
// import 'package:teach_mate/models/education/notification_model.dart';
// import 'package:teach_mate/models/response_wrapper.dart';
// import 'package:teach_mate/server/notification_service/notification_service.dart';
// import 'package:teach_mate/utils/common/print_log.dart';
//
// part 'notification_list_event.dart';
//
// part 'notification_list_state.dart';
//
// class NotificationListBloc
//     extends Bloc<NotificationListEvent, NotificationListState> {
//   NotificationListBloc() : super(NotificationListInitial()) {
//     on<GetNotificationListEvent>(_onGetNotificationListEvent);
//     on<LoadMoreNotificationListEvent>(_onLoadMoreNotificationListEvent);
//   }
//
//   FutureOr<void> _onGetNotificationListEvent(
//       GetNotificationListEvent event,
//       Emitter<NotificationListState> emit,
//       ) async {
//     try {
//       emit(NotificationListLoading());
//       final response=await EduNotificationService.instance.getNotifications();
//       if(response.status==RepoResponseStatus.success){
//         emit(NotificationListSuccess());
//         emit(NotificationListLoaded(model: response.response));
//       }else{
//         emit(NotificationListError(response.message??someWentWrong));
//       }
//     } catch (e, s) {
//       errorLog(s.toString()+e.toString());
//       emit(NotificationListError(e.toString()));
//     }
//   }
//
//   FutureOr<void> _onLoadMoreNotificationListEvent(
//       LoadMoreNotificationListEvent event,
//       Emitter<NotificationListState> emit,
//       ) async {
//     if (state is! NotificationListLoaded) return;
//     final cast = state as NotificationListLoaded;
//     try {
//       emit(NotificationListLoaded(model: cast.model, moreLoading: true));
//       final page = (cast.currentPage ?? 0) + 1;
//       List<EduNotificationModel> list =
//           cast.model.notifications ?? <EduNotificationModel>[];
//       final response =
//       await EduNotificationService.instance.getNotifications(page: page);
//       if (response.status == RepoResponseStatus.success) {
//         EduNotificationListModel model =
//         response.response as EduNotificationListModel;
//         list.addAll(model.notifications ?? <EduNotificationModel>[]);
//         emit(NotificationListLoaded(
//           currentPage: page,
//           hasMore: (model.totalItems ?? 0) > page,
//           model: model.copyWith(notifications: list),
//         ));
//       } else {
//         emit(NotificationListLoaded(model: cast.model));
//       }
//     } catch (e, s) {
//       errorLog(e.toString() + s.toString());
//       emit(NotificationListLoaded(model: cast.model));
//     }
//   }
// }
//
//
// part of 'notification_list_bloc.dart';
//
// abstract class NotificationListState extends Equatable {
//   const NotificationListState();
// }
//
// class NotificationListInitial extends NotificationListState {
//   @override
//   List<Object> get props => [];
// }
//
// class NotificationListLoading extends NotificationListState {
//   @override
//   List<Object> get props => [];
// }
//
// class NotificationListLoaded extends NotificationListState {
//   final bool hasMore;
//   final int currentPage;
//   final bool moreLoading;
//   final EduNotificationListModel model;
//
//   NotificationListLoaded({
//     this.hasMore=true,
//     this.currentPage=1,
//     this.moreLoading=false,
//     required this.model,
//   });
//
//   @override
//   List<Object> get props => [
//     hasMore,
//     currentPage,
//     moreLoading,
//     model,
//   ];
// }
//
// class NotificationListSuccess extends NotificationListState {
//   @override
//   List<Object> get props => [];
// }
//
// class NotificationListError extends NotificationListState {
//   final String error;
//
//   NotificationListError(this.error);
//
//   @override
//   List<Object> get props => [error];
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:teach_mate/business_logics/blocs/notification_list_bloc/notification_list_bloc.dart';
// import 'package:teach_mate/business_logics/service/all_getter_setter.dart';
// import 'package:teach_mate/models/education/notification_model.dart';
// import 'package:teach_mate/screens/dashboard_screen/dashboard.dart';
// import 'package:teach_mate/utils/common/AppColors.dart';
// import 'package:teach_mate/utils/common/app_bar/common_app_bar.dart';
// import 'package:teach_mate/utils/common/app_common_button.dart';
// import 'package:teach_mate/utils/common/app_common_image.dart';
// import 'package:teach_mate/utils/common/app_config.dart';
// import 'package:teach_mate/utils/common/app_date_time_picker.dart';
// import 'package:teach_mate/utils/common/app_text.dart';
// import 'package:teach_mate/utils/common/navigator_extension.dart';
// import 'package:teach_mate/utils/common/pull_to_refresh_widget.dart';
//
// class NotificationScreen extends StatelessWidget {
//   NotificationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return PullToRefreshWidget(
//       onRefresh: () =>
//           context.read<NotificationListBloc>().add(GetNotificationListEvent()),
//       child: Scaffold(
//         appBar: const AppBarCommon(
//           title: "Notifications",
//         ),
//         body: BlocBuilder<NotificationListBloc, NotificationListState>(
//           builder: (context, state) {
//             if (state is! NotificationListLoaded) {
//               return getCustomLoading();
//             }
//             final list =
//                 state.model.notifications ?? <EduNotificationModel>[];
//             if (list.isEmpty) {
//               return const NoDataFoundWidget();
//             }
//             return NotificationListener<ScrollNotification>(
//               onNotification: (notification) => _getLoadMore(
//                 context: context,
//                 notification: notification,
//                 hasMore: state.hasMore,
//                 moreLoading: state.moreLoading,
//               ),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: list.length,
//                 padding: EdgeInsets.zero,
//                 itemBuilder: (context, index) {
//                   final item = list[index];
//                   return Card(
//                     child: ListTile(
//                       title: AppText(
//                         (item.title ?? "")
//                             .toCapitalizeFirstWordOnly(),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           AppText(
//                             (item.body ?? "")
//                                 .toCapitalizeFirstWordOnly(),
//                             maxLines: 3,
//                             fontSize: 13.sp,
//                             overflow: TextOverflow.ellipsis,
//                           ).paddingOnly(bottom: 4.h),
//                           Row(
//                             children: [
//                               const Spacer(),
//                               AppText(
//                                 getTimeSinceCreation(item.createdAt),
//                                 color: AppColors.greenColor,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ).paddingSymmetric(vertical: 2.h);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   bool _getLoadMore({
//     required BuildContext context,
//     required ScrollNotification notification,
//     required bool hasMore,
//     required bool moreLoading,
//   }) {
//     if (notification is ScrollEndNotification &&
//         notification.metrics.extentAfter == 0 &&
//         hasMore &&
//         !moreLoading) {
//       context.read<NotificationListBloc>().add(LoadMoreNotificationListEvent());
//       return true;
//     }
//     return false;
//   }
// }