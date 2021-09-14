import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/binding/dashboard_tab_binding.dart';
import 'package:unnoficial_kitsu_client/binding/login_binding.dart';
import 'package:unnoficial_kitsu_client/binding/place_detail_binding.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_page.dart';
import 'package:unnoficial_kitsu_client/feature/dashboardtab/dashboard_tab_page.dart';
import 'package:unnoficial_kitsu_client/feature/loader/loading_page.dart';
import 'package:unnoficial_kitsu_client/feature/login/login_page.dart';
import 'package:unnoficial_kitsu_client/feature/other/other_page.dart';
import 'package:unnoficial_kitsu_client/feature/places/detail/place_detail_page.dart';

import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PageName.LOADER,
      page: () => LoadingPage(),
    ),
    GetPage(
        name: PageName.DASHBOARD,
        page: () => DashBoardTabPage(),
        binding: DashBoardTabBinding()),
    GetPage(name: PageName.OTHER, page: () => OtherPage()),
    GetPage(
        name: PageName.USER_DETAIL,
        page: () => PlaceDetailPage(),
        binding: PlaceDetailBinding()),
    GetPage(
        name: PageName.ANIME,
        page: () => AnimePage(),
        binding: DashBoardTabBinding())
  ];
}
