import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/data/remote/wrapper/model_factory.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_types.dart';
import 'package:unnoficial_kitsu_client/hive_helper/hive_adapters.dart';
import 'package:unnoficial_kitsu_client/hive_helper/fields/relationship_links_fields.dart';
import 'package:unnoficial_kitsu_client/utills/helper/convert_json.dart';

part 'relationship_links.g.dart';

@HiveType(
    typeId: HiveTypes.relationshipLinks,
    adapterName: HiveAdapters.relationshipLinks)
class RelationshipLinks extends HiveObject implements ModelFactory {
  RelationshipLinks({
    required this.self,
    required this.related,
  });

  @HiveField(RelationshipLinksFields.self)
  final String self;
  @HiveField(RelationshipLinksFields.related)
  final String related;

  factory RelationshipLinks.fromJson(Map<String, dynamic> json) =>
      RelationshipLinks(
        self: jsonStringData(json["self"], ""),
        related: jsonStringData(json["related"], ""),
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "related": related,
      };
}
