import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/base_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/upcoming_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/dashboardtab/dashboard_tab_controller.dart';
import 'package:unnoficial_kitsu_client/feature/manga/controller/trending_manga_controller.dart';
import 'package:unnoficial_kitsu_client/feature/manga/controller/upcoming_manga_controller.dart';

class DashBoardTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardTabController>(() => DashBoardTabController());
    Get.lazyPut<TrendingAnimeController>(() => TrendingAnimeController());
    Get.lazyPut<UpcomingAnimeController>(() => UpcomingAnimeController());
    Get.lazyPut<BaseAnimeController>(() => BaseAnimeController());
    Get.lazyPut<TrendingMangaController>(() => TrendingMangaController());
    Get.lazyPut<UpcomingMangaController>(() => UpcomingMangaController());
  }
}
