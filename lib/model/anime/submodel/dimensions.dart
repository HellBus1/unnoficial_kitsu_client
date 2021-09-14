import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/dimensions_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'large.dart';

part 'dimensions.g.dart';

@HiveType(typeId: HiveTypes.dimensions, adapterName: HiveAdapters.dimensions)
class Dimensions extends HiveObject implements ModelFactory {
  Dimensions({
    required this.tiny,
    required this.small,
    required this.large,
    required this.medium,
  });

  @HiveField(DimensionsFields.tiny)
  final Large tiny;
  @HiveField(DimensionsFields.small)
  final Large small;
  @HiveField(DimensionsFields.large)
  final Large large;
  @HiveField(DimensionsFields.medium)
  final Large medium;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        tiny: Large.fromJson(jsonObjectData(json["tiny"], {"": ""})),
        small: Large.fromJson(jsonObjectData(json["small"], {"": ""})),
        large: Large.fromJson(jsonObjectData(json["large"], {"": ""})),
        medium: Large.fromJson(jsonObjectData(json["medium"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny.toJson(),
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
      };
}
