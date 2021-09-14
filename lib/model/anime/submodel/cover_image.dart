import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/cover_image_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'meta.dart';

part 'cover_image.g.dart';

@HiveType(typeId: HiveTypes.coverImage, adapterName: HiveAdapters.coverImage)
class CoverImage extends HiveObject implements ModelFactory {
  CoverImage({
    required this.tiny,
    required this.small,
    required this.large,
    required this.original,
    required this.meta,
  });

  @HiveField(CoverImageFields.tiny)
  final String tiny;
  @HiveField(CoverImageFields.small)
  final String small;
  @HiveField(CoverImageFields.large)
  final String large;
  @HiveField(CoverImageFields.original)
  final String original;
  @HiveField(CoverImageFields.meta)
  final Meta meta;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        tiny: jsonStringData(json["tiny"], ""),
        small: jsonStringData(json["small"], ""),
        large: jsonStringData(json["large"], ""),
        original: jsonStringData(json["original"], ""),
        meta: Meta.fromJson(jsonObjectData(json["meta"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny,
        "small": small,
        "large": large,
        "original": original,
        "meta": meta.toJson(),
      };
}
