import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/dashboardtab/dashboard_tab_controller.dart';

class DashBoardTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardTabController>(() => DashBoardTabController());
    Get.lazyPut<TrendingAnimeController>(() => TrendingAnimeController());
  }
}
