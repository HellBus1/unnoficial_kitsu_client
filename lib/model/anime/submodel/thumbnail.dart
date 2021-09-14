import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/thumbnail_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'meta.dart';

part 'thumbnail.g.dart';

@HiveType(typeId: HiveTypes.thumbnail, adapterName: HiveAdapters.thumbnail)
class Thumbnail extends HiveObject implements ModelFactory {
  Thumbnail({
    required this.original,
    required this.meta,
  });

  @HiveField(ThumbnailFields.original)
  final String original;
  @HiveField(ThumbnailFields.meta)
  final Meta meta;

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        original: jsonStringData(json["original"], ""),
        meta: Meta.fromJson(jsonObjectData(json["meta"], {"": ""})),
      );

  Map<String, dynamic> toMap() => {
        "original": original,
        "meta": meta.toJson(),
      };
}
