import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/dashboardtab/dashboard_tab_controller.dart';
import 'package:unnoficial_kitsu_client/feature/dialog/dialog_controller.dart';
import 'package:unnoficial_kitsu_client/feature/maps/maps_controller.dart';
import 'package:unnoficial_kitsu_client/feature/places/places_controller.dart';

class DashBoardTabBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DashBoardTabController>(() => DashBoardTabController());
    // Get.lazyPut<PlaceController>(() => PlaceController());
    // Get.lazyPut<DialogController>(() => DialogController());
    // Get.lazyPut<MapsController>(() => MapsController());
    Get.lazyPut<TrendingAnimeController>(() => TrendingAnimeController());
  }
}
