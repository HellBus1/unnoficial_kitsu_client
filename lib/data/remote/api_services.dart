import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unnoficial_kitsu_client/model/anime/base_anime.dart';
import 'package:unnoficial_kitsu_client/model/anime/episode.dart';
import 'package:unnoficial_kitsu_client/model/login_result.dart';
import 'package:unnoficial_kitsu_client/model/place.dart';
import 'environment.dart';
import 'interceptor/dio.dart';
import 'wrapper/api_response.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    return RestClient(
      await AppDio().getDIO(
          headers: headers,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @POST("/api/user/login")
  Future<ApiResponse<LoginResult>> login(
      @Query("email") String email, @Query("password") String password);

  @GET("/api/places")
  Future<ApiResponses<Place>> getPlaces(
      @Query("page") int page, @Query("perPage") int perPage);

  @GET("/api/places/{id}")
  Future<ApiResponse<Place>> getPlaceDetail(@Path("id") int id);

  @GET("/anime")
  Future<ApiResponses<BaseAnime>> getAnimes(
      @Query("page[limit]") int limit,
      @Query("page[offset]") int offset,
      @Query("sort") String sort,
      @Query("filter[status]") String status);

  @GET("/anime/{id}")
  Future<ApiResponse<BaseAnime>> getAnimeDetail(@Path("id") int id);

  @GET("/trending/anime")
  Future<ApiResponses<BaseAnime>> getTrendingAnime(
      @Query("page[limit]") int limit,
      @Query("page[offset]") int offset,
      @Query("sort") String sort);

  @GET("/anime/{id}/episodes")
  Future<ApiResponses<Episode>> getAnimeEpisodes();

  // @GET("/anime/{id}/category")

  // @GET("/anime/{id}/genres")
}

final client = RestClient.create();
