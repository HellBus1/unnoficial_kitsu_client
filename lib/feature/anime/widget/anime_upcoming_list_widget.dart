import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/upcoming_anime_controller.dart';
import 'package:unnoficial_kitsu_client/utills/widget/anime_item_widget.dart';
import 'package:unnoficial_kitsu_client/utills/widget/heading.dart';

class AnimeUpcomingListWidget extends StatelessWidget {
  final UpcomingAnimeController controller;

  AnimeUpcomingListWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Heading(
            title: "Upcoming",
          ),
        ),
        Container(
          height: ((MediaQuery.of(context).size.width * 0.85) / 320 * 150),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: controller.hasNext,
              controller: controller.refreshController,
              onRefresh: controller.getUpcomingAnime,
              onLoading: controller.loadNextPage,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, index) {
                    var item = controller.dataList[index];
                    return AnimeItemWidget(index: index, baseAnime: item);
                  })),
        )
      ],
    );
  }
}
