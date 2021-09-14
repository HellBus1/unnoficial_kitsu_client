import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/media_links_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

part 'media_links.g.dart';

@HiveType(typeId: HiveTypes.mediaLinks, adapterName: HiveAdapters.mediaLinks)
class MediaLinks extends HiveObject implements ModelFactory {
  MediaLinks({
    required this.self,
    required this.related,
  });

  @HiveField(MediaLinksFields.self)
  final String self;
  @HiveField(MediaLinksFields.related)
  final String related;

  factory MediaLinks.fromJson(Map<String, dynamic> json) => MediaLinks(
        self: jsonStringData(json["self"], ""),
        related: jsonStringData(json["related"], ""),
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "related": related,
      };
}
