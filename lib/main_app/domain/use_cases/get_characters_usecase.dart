import 'package:task2/main_app/domain/repositories/app_repository.dart';

import '../../data/models/characters_model.dart';

class GetCharactersUseCase {
  final AppRepository _appRepository;

  // Constructor with dependency injection of TodoRepository
  GetCharactersUseCase(this._appRepository);

  // Method to fetch all todos asynchronously
  Future<List<CharacterModel>> call() async {
    // Await the result of fetching todos from TodoRepository

    var results = await _appRepository.getCharacters();
    return results;
  }
}