import '../../data/models/characters_model.dart';
import '../repositories/app_repository.dart';

class GetCharactersByIdUseCase {
  final AppRepository _appRepository;

  // Constructor with dependency injection of TodoRepository
  GetCharactersByIdUseCase(this._appRepository);

  // Method to fetch all todos asynchronously
  Future<CharacterModel> call(String id) async {
    // Await the result of fetching todos from TodoRepository

    var results = await _appRepository.getCharacterById(id);
    return results;
  }
}