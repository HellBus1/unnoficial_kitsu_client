import 'dart:convert';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/detail/controller/anime_detail_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/detail/widgets/detail_description_header_widget.dart';
import 'package:unnoficial_kitsu_client/feature/anime/detail/widgets/video_item_widget.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:unnoficial_kitsu_client/model/episode.dart';
import 'package:unnoficial_kitsu_client/utills/widget/colored_safe_area.dart';
import 'package:unnoficial_kitsu_client/utills/widget/state_handle_widget.dart';

class AnimeDetailPage extends StatelessWidget {
  final BaseManganime manganime = BaseManganime.fromJson(Get.arguments);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimeDetailController>(
        init: AnimeDetailController(manganime: manganime),
        builder: (controller) {
          return StateHandleWidget(
              loadingEnabled: controller.isShimmering,
              emptyEnabled: controller.isEmptyData,
              emptySubtitle: 'txt_empty_user'.tr,
              errorEnabled: controller.isError,
              errorText: 'txt_error_general'.tr,
              onRetryPressed: () {
                controller.refreshPage();
              },
              body: ColoredSafeArea(
                color: Colors.black,
                child: Scaffold(
                  body: CustomScrollView(
                    slivers: [
                      getSliverAppBar(),
                      getHeader(),
                      getSliverList(controller.dataList)
                    ],
                  ),
                ),
              ));
        });
  }

  SliverAppBar getSliverAppBar() {
    return SliverAppBar(
      expandedHeight: Get.height * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: FancyShimmerImage(
          imageUrl: manganime.attributes.coverImage.small,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }

  SliverList getHeader() {
    return SliverList(
        delegate: SliverChildListDelegate([
      DetailDescriptionHeaderWidget(
        manganime: manganime,
        marginVertical: 20,
        marginHorizontal: 15,
      )
    ]));
  }

  SliverList getSliverList(episodes) {
    // print(episodes.length);
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: VideoItemWidget(
              episode: episodes[index],
              index: index,
            ),
          ),
          (index < episodes.length - 1)
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    color: Colors.white,
                    height: 20,
                  ),
                )
              : Container()
        ],
      );
    }, childCount: episodes.length));
  }
}
