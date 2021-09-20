import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:unnoficial_kitsu_client/model/submodel/welcome_links.dart';
import 'package:unnoficial_kitsu_client/model/submodel/titles.dart';
import 'package:unnoficial_kitsu_client/model/submodel/relationship.dart';
import 'package:unnoficial_kitsu_client/model/submodel/relationship_links.dart';
import 'package:unnoficial_kitsu_client/model/submodel/poster_image.dart';
import 'package:unnoficial_kitsu_client/model/submodel/meta.dart';
import 'package:unnoficial_kitsu_client/model/submodel/large.dart';
import 'package:unnoficial_kitsu_client/model/submodel/dimensions.dart';
import 'package:unnoficial_kitsu_client/model/submodel/cover_image.dart';
import 'package:unnoficial_kitsu_client/model/submodel/attributes.dart';
import 'package:unnoficial_kitsu_client/model/episode.dart';
import 'package:unnoficial_kitsu_client/model/submodel/episode_attributes.dart';
import 'package:unnoficial_kitsu_client/model/submodel/episode_relationship.dart';
import 'package:unnoficial_kitsu_client/model/submodel/media_links.dart';
import 'package:unnoficial_kitsu_client/model/submodel/media.dart';
import 'package:unnoficial_kitsu_client/model/submodel/thumbnail.dart';

void registerAdapters() {
  Hive.registerAdapter(WelcomeAdapter());
  Hive.registerAdapter(WelcomeLinksAdapter());
  Hive.registerAdapter(TitlesAdapter());
  Hive.registerAdapter(RelationshipAdapter());
  Hive.registerAdapter(RelationshipLinksAdapter());
  Hive.registerAdapter(PosterImageAdapter());
  Hive.registerAdapter(MetaAdapter());
  Hive.registerAdapter(LargeAdapter());
  Hive.registerAdapter(DimensionsAdapter());
  Hive.registerAdapter(CoverImageAdapter());
  Hive.registerAdapter(AttributesAdapter());
  Hive.registerAdapter(EpisodeAdapter());
  Hive.registerAdapter(EpisodeAttributesAdapter());
  Hive.registerAdapter(EpisodeRelationshipAdapter());
  Hive.registerAdapter(MediaLinksAdapter());
  Hive.registerAdapter(MediaAdapter());
  Hive.registerAdapter(ThumbnailAdapter());
}
