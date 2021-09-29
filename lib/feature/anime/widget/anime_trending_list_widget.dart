import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/routes/page_names.dart';
import 'package:unnoficial_kitsu_client/utills/widget/item_widget.dart';
import 'package:unnoficial_kitsu_client/utills/widget/heading.dart';

class AnimeTrendingListWidget extends StatelessWidget {
  final TrendingAnimeController controller;

  AnimeTrendingListWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Heading(
              title: "Trending Now",
            ),
          ),
          Container(
            height: ((MediaQuery.of(context).size.width * 0.85) / 320 * 150),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: controller.hasNext,
                controller: controller.refreshController,
                onRefresh: controller.getTrendingAnime,
                onLoading: controller.loadNextPage,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      var item = controller.dataList[index];
                      return ItemWidget(
                        index: index,
                        baseAnime: item,
                        onTap: () {
                          Get.toNamed(PageName.ANIME_DETAIL,
                              arguments: item.toJson());
                        },
                      );
                    })),
          ),
        ]);
  }
}
