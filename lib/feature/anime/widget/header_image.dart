import 'dart:math';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/trending_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/controller/upcoming_anime_controller.dart';
import 'package:unnoficial_kitsu_client/feature/anime/widget/header_description.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';

class HeaderImage extends StatelessWidget {
  HeaderImage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrendingAnimeController>(builder: (controller) {
      if (controller.dataList.length >= 1) {
        var animeItem =
            controller.dataList[Random().nextInt(controller.dataList.length)];
        return Stack(
          children: [
            Container(height: Get.height * 0.65),
            Container(
              width: double.infinity,
              height: Get.height * 0.55,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height * 0.9));
                },
                blendMode: BlendMode.dstIn,
                child: FancyShimmerImage(
                  imageUrl: animeItem.attributes.posterImage.original,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: HeaderDescription(baseAnime: animeItem))
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
