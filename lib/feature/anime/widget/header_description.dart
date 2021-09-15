import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:unnoficial_kitsu_client/utills/widget/custom_button.dart';
import 'package:intl/intl.dart';

class HeaderDescription extends StatelessWidget {
  final BaseAnime baseAnime;

  HeaderDescription({required this.baseAnime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(baseAnime.attributes.canonicalTitle),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text("(${baseAnime.attributes.titles.jaJp})"),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text("${baseAnime.attributes.averageRating}% Match"),
                SizedBox(
                  width: 15,
                ),
                Text(DateFormat('yyyy').format(baseAnime.attributes.startDate)),
                SizedBox(
                  width: 15,
                ),
                Text(baseAnime.attributes.showType == "TV"
                    ? "${baseAnime.attributes.showType} Series"
                    : baseAnime.attributes.showType)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              baseAnime.attributes.description,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(callback: () {}, type: "watch"),
                CustomButton(callback: () {}, type: "information")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
