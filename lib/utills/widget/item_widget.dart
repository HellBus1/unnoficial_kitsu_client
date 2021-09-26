import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:sizer/sizer.dart';

class ItemWidget extends StatelessWidget {
  final int index;
  final BaseManganime baseAnime;
  final Function onTap;

  const ItemWidget(
      {required this.index, required this.baseAnime, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          width: 120,
          height: ((MediaQuery.of(context).size.width * 0.85) / 320 * 120),
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
