import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/welcome_fields.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'submodel/attributes.dart';
import 'submodel/relationship.dart';
import 'submodel/welcome_links.dart';

part 'base_manganime.g.dart';

@HiveType(typeId: HiveTypes.welcome, adapterName: HiveAdapters.welcome)
class BaseManganime extends HiveObject implements ModelFactory {
  BaseManganime({
    required this.id,
    required this.type,
    required this.links,
    required this.attributes,
    required this.relationships,
  });

  @HiveField(WelcomeFields.id)
  final String id;
  @HiveField(WelcomeFields.type)
  final String type;
  @HiveField(WelcomeFields.links)
  final WelcomeLinks links;
  @HiveField(WelcomeFields.attributes)
  final Attributes attributes;
  @HiveField(WelcomeFields.relationships)
  final Map<String, Relationship> relationships;

  factory BaseManganime.fromJson(Map<String, dynamic> json) => BaseManganime(
        id: jsonStringData(json["id"], ""),
        type: jsonStringData(json["type"], ""),
        links: WelcomeLinks.fromJson(jsonObjectData(json["links"], {})),
        attributes: Attributes.fromJson(jsonObjectData(json["attributes"], {})),
        relationships: Map.from(jsonObjectData(json["relationships"], {})).map(
            (k, v) =>
                MapEntry<String, Relationship>(k, Relationship.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "links": links.toJson(),
        "attributes": attributes.toJson(),
        "relationships": Map.from(relationships)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}
