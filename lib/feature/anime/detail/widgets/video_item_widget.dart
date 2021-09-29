import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unnoficial_kitsu_client/model/episode.dart';

class VideoItemWidget extends StatelessWidget {
  final Episode episode;
  final int index;

  VideoItemWidget({required this.episode, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FancyShimmerImage(
          width: Get.width * 0.26,
          imageUrl: episode.attributes.thumbnail.original,
          boxFit: BoxFit.cover,
        ),
      ),
      title: Text(
        '${index + 1}. ${episode.attributes.canonicalTitle}',
        style: TextStyle(
            color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(episode.attributes.synopsis,
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
          maxLines: 2,
          overflow: TextOverflow.ellipsis),
    );
  }
}
