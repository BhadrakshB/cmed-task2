import 'package:flutter/foundation.dart';

import '../../domain/repositories/app_repository.dart';
import '../data_sources/characters_data_source.dart';
import '../models/characters_model.dart';

class AppRepositoryImpl extends AppRepository {

  final CharactersDataSource _charactersDataSource;

  AppRepositoryImpl(this._charactersDataSource);


  @override
  Future<List<CharacterModel>> getCharacters() async {
    return _charactersDataSource.getCharacters();
  }

  @override
  Future<CharacterModel> getCharacterById(String id) async {
    return _charactersDataSource.getCharacterById(id);
  }

}