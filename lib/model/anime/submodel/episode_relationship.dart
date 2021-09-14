import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/episode_relationship_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'media.dart';

part 'episode_relationship.g.dart';

@HiveType(
    typeId: HiveTypes.episodeRelationship,
    adapterName: HiveAdapters.episodeRelationship)
class EpisodeRelationship extends HiveObject implements ModelFactory {
  EpisodeRelationship({
    required this.media,
    required this.videos,
  });

  @HiveField(EpisodeRelationshipFields.media)
  final Media media;
  @HiveField(EpisodeRelationshipFields.videos)
  final Media videos;

  factory EpisodeRelationship.fromJson(Map<String, dynamic> json) =>
      EpisodeRelationship(
        media: Media.fromJson(jsonObjectData(json["media"], {"": ""})),
        videos: Media.fromJson(jsonObjectData(json["videos"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "media": media.toJson(),
        "videos": videos.toJson(),
      };
}
