import 'package:dio/dio.dart';
import 'package:task2/api_client/api_service.dart';
import 'package:task2/main_app/data/models/characters_model.dart';

class CharactersDataSource {
  List<CharacterModel> characters=[];
  final service = ApiService(Dio(BaseOptions(contentType: "application/json"),),);

  Future<List<CharacterModel>> getCharacters() async {
    try {
      final response = await service.fetchCharacters();
      return response;
    } catch(e) {
      throw Exception("Failed to fetch cahracters from Hogwarts");
    }
  }
}