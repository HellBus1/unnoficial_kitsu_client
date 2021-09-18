import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_page.dart';
import 'package:unnoficial_kitsu_client/utills/widget/colored_status_bar.dart';

import 'dashboard_tab_controller.dart';

class DashBoardTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardTabController>(
      builder: (controller) {
        return ColoredStatusBar(
          color: Colors.transparent,
          child: Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [AnimePage(), Container()],
              ),
            ),
            extendBodyBehindAppBar: true,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: BottomNavigationBar(
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.tv,
                    label: 'txt_menu_anime'.tr,
                  ),
                  _bottomNavigationBarItem(
                    icon: CupertinoIcons.book,
                    label: 'txt_menu_manga'.tr,
                  ),
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
