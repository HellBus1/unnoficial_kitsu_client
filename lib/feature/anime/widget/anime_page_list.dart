import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/upcoming_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_trending_list_widget.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_upcoming_list_widget.dart';
import 'package:unnoficial_kitsu_client/utills/widget/heading.dart';

import '../../../utills/widget/anime_item_widget.dart';

class AnimePageList extends StatelessWidget {
  final TrendingAnimeController trendingAnimeController;
  const AnimePageList({required this.trendingAnimeController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimeTrendingListWidget(
          controller: trendingAnimeController,
        ),
        // AnimeUpcomingListWidget(),
      ],
    );
  }
}
