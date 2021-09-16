import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unnoficial_kitsu_client/themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final Function callback;
  final String type;

  CustomButton({required this.callback, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (this.type) {
      case "watch":
        return TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () => callback,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black87,
                    size: 24,
                  ),
                  Text('txt_trailer'.tr,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87))
                ],
              ),
            ));
      case "information":
        return TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[850])),
            onPressed: () => callback,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('txt_information'.tr,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white))
                ],
              ),
            ));
      default:
        return Container();
    }
  }
}
