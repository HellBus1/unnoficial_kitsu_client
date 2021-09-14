import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_page.dart';
import 'package:unnoficial_kitsu_client/feature/dialog/sample_dialog_page.dart';
import 'package:unnoficial_kitsu_client/feature/maps/maps_page.dart';
import 'package:unnoficial_kitsu_client/feature/other/other_page.dart';
import 'package:unnoficial_kitsu_client/feature/places/places_page.dart';
import 'package:unnoficial_kitsu_client/utills/widget/colored_status_bar.dart';

import 'dashboard_tab_controller.dart';

class DashBoardTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardTabController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  PlacePage(),
                  DialogPage(),
                  MapsPage(),
                  OtherPage(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border:
                      Border(top: BorderSide(color: Colors.white, width: 1.0))),
              child: BottomNavigationBar(
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.home,
                    label: 'txt_menu_home'.tr,
                  ),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.book,
                    label: 'txt_menu_dialog'.tr,
                  ),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.map,
                    label: 'txt_menu_maps'.tr,
                  ),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.bag,
                    label: 'txt_menu_other'.tr,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
