import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/media_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'media_links.dart';

part 'media.g.dart';

@HiveType(typeId: HiveTypes.media, adapterName: HiveAdapters.media)
class Media extends HiveObject implements ModelFactory {
  Media({
    required this.links,
  });

  @HiveField(MediaFields.links)
  final MediaLinks links;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        links: MediaLinks.fromJson(jsonObjectData(json["links"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
      };
}
