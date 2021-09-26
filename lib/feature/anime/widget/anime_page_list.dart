import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/upcoming_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_trending_list_widget.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_upcoming_list_widget.dart';
import 'package:unnoficial_kitsu_client/utills/widget/heading.dart';
import 'package:unnoficial_kitsu_client/utills/widget/shimmer_widget/listview_shimmer.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';

import '../../../utills/widget/item_widget.dart';

class AnimePageList extends StatelessWidget {
  const AnimePageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<TrendingAnimeController>(builder: (controller) {
          return StateHandleWidget(
              loadingEnabled: controller.isShimmering,
              emptyEnabled: controller.isEmptyData,
              emptySubtitle: 'txt_empty_user'.tr,
              errorEnabled: controller.isError,
              errorText: 'txt_error_general'.tr,
              onRetryPressed: () {
                controller.refreshPage();
              },
              shimmerView: ListViewShimmer(),
              body: AnimeTrendingListWidget(
                controller: controller,
              ));
        }),
        SizedBox(
          height: 15,
        ),
        GetBuilder<UpcomingAnimeController>(builder: (controller) {
          return StateHandleWidget(
              loadingEnabled: controller.isShimmering,
              emptyEnabled: controller.isEmptyData,
              emptySubtitle: 'txt_empty_user'.tr,
              errorEnabled: controller.isError,
              errorText: 'txt_error_general'.tr,
              onRetryPressed: () {
                controller.refreshPage();
              },
              shimmerView: ListViewShimmer(),
              body: AnimeUpcomingListWidget(
                controller: controller,
              ));
        }),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
