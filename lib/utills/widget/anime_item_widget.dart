import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:sizer/sizer.dart';
import 'package:unnoficial_kitsu_client/utills/widget/custom_title.dart';

class AnimeItemWidget extends StatelessWidget {
  final int index;
  final BaseAnime baseAnime;

  const AnimeItemWidget({required this.index, required this.baseAnime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          width: 120,
          height: ((MediaQuery.of(context).size.width * 0.85) / 320 * 140),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FancyShimmerImage(
              imageUrl: baseAnime.attributes.posterImage.small,
              boxFit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
