import 'package:hive/hive.dart';
import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/welcome_links.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/titles.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/relationship.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/relationship_links.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/poster_image.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/meta.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/large.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/dimensions.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/cover_image.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/attributes.dart';
import 'package:unnoficial_kitsu_client/model/anime/episode.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/episode_attributes.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/episode_relationship.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/media_links.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/media.dart';
import 'package:unnoficial_kitsu_client/model/anime/submodel/thumbnail.dart';

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
