import 'package:dio/dio.dart';
import 'package:task2/api_client/api_service.dart';
import 'package:task2/main_app/data/models/characters_model.dart';

import '../models/characters_model.dart';

class CharactersDataSource {
  final service = ApiService(Dio(BaseOptions(contentType: "application/json"),),);

  Future<List<CharacterModel>> getCharacters() async {
    // try {
      final response = await service.fetchCharacters();
      print("RESPONSE: ${response}");
      return response;
    // } catch(e) {
    //   throw Exception("ERROR: ${e}");
    // }
  }

  Future<CharacterModel> getCharacterById(String id) async {
    try {
      final response = (await service.fetchCharacterFromId(id) as List<dynamic>).elementAt(0);

      return response;
    } catch(e) {
      print("ERROR: $e");
      throw Exception("$e : Failed to fetch character with id: $id from Hogwarts");
    }
  }
}