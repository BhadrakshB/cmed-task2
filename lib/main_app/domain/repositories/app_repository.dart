import '../../data/models/characters_model.dart';

abstract class AppRepository {
  Future<List<CharacterModel>> getCharacters();
  Future<CharacterModel> getCharacterById(String id);
}