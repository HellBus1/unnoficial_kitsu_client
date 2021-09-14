import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:sizer/sizer.dart';

class AnimeItemWidget extends StatelessWidget {
  final int index;
  final BaseAnime baseAnime;

  const AnimeItemWidget({required this.index, required this.baseAnime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FancyShimmerImage(
            imageUrl: baseAnime.attributes.posterImage.small,
            boxFit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
