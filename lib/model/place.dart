import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/local/hive/hive_types.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';

part 'place.g.dart';

@HiveType(typeId: HiveTypes.place)
class Place extends HiveObject implements ModelFactory {
  Place({
    required this.id,
    this.placeCategoryId,
    this.name,
    this.description,
    this.address,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  int? placeCategoryId;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? address;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        placeCategoryId: json["place_category_id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
      );
}
