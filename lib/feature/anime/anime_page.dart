import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_page_sliver.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';
import 'package:sizer/sizer.dart';

class AnimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: GetBuilder<TrendingAnimeController>(
            builder: (controller) {
              return StateHandleWidget(
                  loadingEnabled: controller.isShimmering,
                  emptyEnabled: controller.isEmptyData,
                  emptySubtitle: 'txt_empty_user'.tr,
                  errorEnabled: controller.isError,
                  errorText: 'txt_error_general'.tr,
                  onRetryPressed: () {
                    // controller.getAnimes();
                  },
                  body: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [AnimePageList(controller)],
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
