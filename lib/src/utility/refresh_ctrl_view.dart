import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshCtrlView extends StatelessWidget {
  final RefreshController refreshController;
  final Function()? onRefresh;
  final Function()? onLoading;
  final Widget child;
  final bool enableRefresh;
  final bool enableLoadMore;
  const RefreshCtrlView({super.key, required this.refreshController, this.onRefresh, this.onLoading, required this.child,  this.enableRefresh = true,  this.enableLoadMore = true});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: enableRefresh,
      enablePullUp: enableLoadMore,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: ( context, mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  const Text("");
            // body =  Text("pull up load");
          }
          else if(mode==LoadStatus.loading){
            body =  const CupertinoActivityIndicator(color: CupertinoColors.black,);
          }
          else if(mode == LoadStatus.failed){
            body = const Text("Load Failed!Click retry!");
          }
          else if(mode == LoadStatus.canLoading){
            body = const Text("release to load more");
          }
          else{
            body = const Text("No more Data");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}

RefreshController RefreshStateController({bool? initialRefresh}) => RefreshController(initialRefresh: initialRefresh ?? false);


