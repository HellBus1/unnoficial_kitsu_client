import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:unnoficial_kitsu_client/model/place.dart';
import 'package:unnoficial_kitsu_client/routes/page_names.dart';

class PlaceListItem extends StatelessWidget {
  final int index;
  final Place mData;
  const PlaceListItem({required this.index, required this.mData});
  final image = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(10.sp),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        onTap: () {
          Get.toNamed(PageName.USER_DETAIL, arguments: mData.id.toString());
        },
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
            title: Text(mData.name ?? ''),
            subtitle: Text(
              mData.description ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
