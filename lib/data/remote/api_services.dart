import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:unnoficial_kitsu_client/model/base_manganime.dart';
import 'package:unnoficial_kitsu_client/model/episode.dart';
import 'package:unnoficial_kitsu_client/model/login_result.dart';
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

  @GET("/anime")
  Future<ApiResponses<BaseManganime>> getAnimes(
      @Query("page[limit]") int limit,
      @Query("page[offset]") int offset,
      @Query("filter[status]") String status);

  @GET("/anime/{id}")
  Future<ApiResponse<BaseManganime>> getAnimeDetail(@Path("id") int id);

  @GET("/trending/anime")
  Future<ApiResponses<BaseManganime>> getTrendingAnime(
      @Query("page[limit]") int limit, @Query("page[offset]") int offset);

  @GET("/anime/{id}/episodes")
  Future<ApiResponses<Episode>> getAnimeEpisodes();

  // @GET("/anime/{id}/category")

  // @GET("/anime/{id}/genres")

  @GET("/manga")
  Future<ApiResponses<BaseManganime>> getManga(
      @Query("page[limit]") int limit,
      @Query("page[offset]") int offset,
      @Query("filter[status]") String status);

  @GET("/trending/manga")
  Future<ApiResponses<BaseManganime>> getTrendingManga(
      @Query("page[limit]") int limit, @Query("page[offset]") int offset);
}

final client = RestClient.create();
