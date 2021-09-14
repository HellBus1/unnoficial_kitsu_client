import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;

  Heading({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline1),
    );
  }
}
