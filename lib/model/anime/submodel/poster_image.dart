import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/poster_image_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'meta.dart';

part 'poster_image.g.dart';

@HiveType(typeId: HiveTypes.posterImage, adapterName: HiveAdapters.posterImage)
class PosterImage extends HiveObject implements ModelFactory {
  PosterImage({
    required this.tiny,
    required this.small,
    required this.medium,
    required this.large,
    required this.original,
    required this.meta,
  });

  @HiveField(PosterImageFields.tiny)
  final String tiny;
  @HiveField(PosterImageFields.small)
  final String small;
  @HiveField(PosterImageFields.medium)
  final String medium;
  @HiveField(PosterImageFields.large)
  final String large;
  @HiveField(PosterImageFields.original)
  final String original;
  @HiveField(PosterImageFields.meta)
  final Meta meta;

  factory PosterImage.fromJson(Map<String, dynamic> json) => PosterImage(
        tiny: jsonStringData(json["tiny"], ""),
        small: jsonStringData(json["small"], ""),
        medium: jsonStringData(json["medium"], ""),
        large: jsonStringData(json["large"], ""),
        original: jsonStringData(json["original"], ""),
        meta: Meta.fromJson(jsonObjectData(json["meta"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny,
        "small": small,
        "medium": medium,
        "large": large,
        "original": original,
        "meta": meta.toJson(),
      };
}
