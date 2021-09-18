import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/anime_page_list.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/header_image.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';
import 'package:sizer/sizer.dart';

class AnimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: HeaderImage(),
          ),
          Container(padding: EdgeInsets.all(10.sp), child: AnimePageList())
        ])),
      ],
    ));
  }
}
