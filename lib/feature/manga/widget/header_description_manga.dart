import 'package:flutter/material.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:unnoficial_kitsu_client/utills/widget/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class HeaderDescriptionManga extends StatelessWidget {
  final BaseManganime baseManganime;

  HeaderDescriptionManga({required this.baseManganime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              baseManganime.attributes.canonicalTitle,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "(${baseManganime.attributes.titles.jaJp})",
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text(
                  "${baseManganime.attributes.averageRating}% Match",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  DateFormat('yyyy').format(baseManganime.attributes.startDate),
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  baseManganime.attributes.showType == "TV"
                      ? "${baseManganime.attributes.showType} Series"
                      : baseManganime.attributes.showType,
                  style: TextStyle(fontSize: 12.sp),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              baseManganime.attributes.description,
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
