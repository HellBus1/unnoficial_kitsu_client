import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  CustomTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ));
  }
}
