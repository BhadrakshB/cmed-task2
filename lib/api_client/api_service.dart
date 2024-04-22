import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task2/main_app/data/models/characters_model.dart';

part 'api_service.g.dart';
@RestApi(baseUrl: "https://hp-api.onrender.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET('/api/characters')
  Future<List<CharacterModel>> fetchCharacters();

  @GET('/api/characters/{id}')
  Future<CharacterModel> fetchCharacterFromId(@Path('id') String id);

}