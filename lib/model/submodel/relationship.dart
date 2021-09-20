import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/relationship_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

import 'relationship_links.dart';

part 'relationship.g.dart';

@HiveType(
    typeId: HiveTypes.relationship, adapterName: HiveAdapters.relationship)
class Relationship extends HiveObject implements ModelFactory {
  Relationship({
    required this.links,
  });

  @HiveField(RelationshipFields.links)
  final RelationshipLinks links;

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        links:
            RelationshipLinks.fromJson(jsonObjectData(json["links"], {"": ""})),
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
      };
}
