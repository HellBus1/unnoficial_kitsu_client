import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unnoficial_kitsu_client/feature/anime/anime_controller.dart';
import 'package:unnoficial_kitsu_client/utills/widget/heading.dart';

import '../../../utills/widget/anime_item_widget.dart';

class AnimePageList extends StatelessWidget {
  const AnimePageList(this.controller, {Key? key}) : super(key: key);

  final TrendingAnimeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(
          title: "Trending Now",
        ),
        Container(
          height: ((MediaQuery.of(context).size.width * 0.85) / 320 * 140),
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
                    return AnimeItemWidget(index: index, baseAnime: item);
                  })),
        )
      ],
    );
  }
}
