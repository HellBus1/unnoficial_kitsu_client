import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';

class DetailDescriptionHeaderWidget extends StatelessWidget {
  final BaseManganime manganime;
  final double marginVertical;
  final double marginHorizontal;

  DetailDescriptionHeaderWidget(
      {required this.manganime,
      required this.marginVertical,
      required this.marginHorizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: marginVertical, horizontal: marginHorizontal),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Text("${manganime.attributes.averageRating} Match"),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Text(
                    DateFormat('yyyy').format(manganime.attributes.startDate)),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Text(
              manganime.attributes.description,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            child: Row(
              children: [Text("${"txt_genres".tr} : ")],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              children: [Text("${"txt_category".tr} : ")],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              children: [
                Text("${"txt_age_rating".tr} : "),
                Text(
                    "${manganime.attributes.ageRating} ${manganime.attributes.ageRatingGuide}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
