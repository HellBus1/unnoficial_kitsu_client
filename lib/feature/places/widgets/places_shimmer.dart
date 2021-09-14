import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unnoficial_kitsu_client/model/place.dart';

import 'place_item.dart';

class PlacesShimmer extends StatelessWidget {
  PlacesShimmer({Key? key}) : super(key: key);

  final Gradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [Colors.grey, Colors.grey, Colors.white, Colors.grey, Colors.grey],
    stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: _buildPlaceListShimmer(),
      gradient: gradient,
    );
  }
}

List<Place> _dummyPlace() {
  List<Place> data = [];

  for (int i = 0; i < 9; i++) {
    var usr = Place(id: i, name: "name", description: "email");
    data.add(usr);
  }
  return data;
}

ListView _buildPlaceListShimmer() {
  return ListView.builder(
    itemCount: _dummyPlace().length,
    itemBuilder: (context, index) {
      return PlaceListItem(
        index: index,
        mData: _dummyPlace()[index],
      );
    },
  );
}
