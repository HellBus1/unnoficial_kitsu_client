import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/binding/dashboard_tab_binding.dart';
import 'package:unnoficial_kitsu_client/binding/login_binding.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_page.dart';
import 'package:unnoficial_kitsu_client/feature/dashboardtab/dashboard_tab_page.dart';
import 'package:unnoficial_kitsu_client/feature/loader/loading_page.dart';
import 'package:unnoficial_kitsu_client/feature/login/login_page.dart';
import 'package:unnoficial_kitsu_client/feature/manga/manga_page.dart';

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
    GetPage(
      name: PageName.ANIME,
      page: () => AnimePage(),
    ),
    GetPage(name: PageName.MANGA, page: () => MangaPage())
  ];
}
