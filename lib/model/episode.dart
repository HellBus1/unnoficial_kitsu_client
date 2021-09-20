import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/episode_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'submodel/episode_attributes.dart';
import 'submodel/episode_relationship.dart';
import 'submodel/welcome_links.dart';

part 'episode.g.dart';

@HiveType(typeId: HiveTypes.episode, adapterName: HiveAdapters.episode)
class Episode extends HiveObject implements ModelFactory {
  Episode({
    required this.id,
    required this.type,
    required this.links,
    required this.attributes,
    required this.relationships,
  });

  @HiveField(EpisodeFields.id)
  final String id;
  @HiveField(EpisodeFields.type)
  final String type;
  @HiveField(EpisodeFields.links)
  final WelcomeLinks links;
  @HiveField(EpisodeFields.attributes)
  final EpisodeAttributes attributes;
  @HiveField(EpisodeFields.relationships)
  final EpisodeRelationship relationships;

  factory Episode.fromMap(Map<String, dynamic> json) => Episode(
        id: jsonStringData(json["id"], ""),
        type: jsonStringData(json["type"], ""),
        links: WelcomeLinks.fromJson(jsonObjectData(json["links"], {"": ""})),
        attributes:
            EpisodeAttributes.fromJson(jsonObjectData(json["attributes"], "")),
        relationships: EpisodeRelationship.fromJson(
            jsonObjectData(json["relationships"], "")),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "links": links.toJson(),
        "attributes": attributes.toJson(),
        "relationships": relationships.toJson(),
      };
}
