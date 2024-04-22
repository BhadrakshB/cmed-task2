import 'package:flutter/cupertino.dart';
import 'package:task2/main_app/data/models/characters_model.dart';
import 'package:task2/main_app/domain/repositories/app_repository.dart';

import '../../data/data_sources/characters_data_source.dart';
import '../../data/repositories/app_repository_impl.dart';
import '../../domain/use_cases/get_characters_by_id_usecase.dart';
import '../../domain/use_cases/get_characters_usecase.dart';

enum FetchState {
  idle,
  fetching,
  fetched,
  error,
}

class CharactersProvider extends ChangeNotifier {
  late final AppRepository _appRepository;

  List<CharacterModel> characters = [];
  CharacterModel? currentCharacter;

  CharactersProvider()
      : _appRepository =
  AppRepositoryImpl(
      CharactersDataSource());

  void _setState({
    required FetchState
    newApiState,
    String errorMessage = '',
    String successMessage =
    '',
  }) {
    _FetchState = newApiState;
    _errorMessage =
        errorMessage;
    _successMessage =
        successMessage;
    notifyListeners();
  }

  FetchState
  _FetchState =
      FetchState.idle;
  String _errorMessage = '';
  String _successMessage = '';



  // Getters for current ApiState and error message
  FetchState
  get state =>
      _FetchState;

  String get errorMessage =>
      _errorMessage;

  String get successMessage =>
      _successMessage;


  Future<void> getCharacters() async {
    _setState(
        newApiState: FetchState
            .fetching); // Set ApiState to fetching
    try {
      var result = await GetCharactersUseCase(
          _appRepository)
          .call();

      characters = result;
      notifyListeners();

      _setState(
          newApiState:
          FetchState
              .fetched);

    } catch (e) {
      print("ERROR: $e");
      _setState(
          newApiState:
          FetchState
              .error,
          errorMessage:
          e.toString());
      // Set ApiState to error if fetch fails
    }
    // Reset ApiState to idle after 5 seconds
    Future.delayed(
      const Duration(seconds: 5),
          () {
        _setState(
            newApiState:
            FetchState
                .idle);
      },

    );

    print("Finished getCharacters function from provider. this is the current state: $_FetchState");
  }

  Future<void> getCharacterById(String id) async {
    _setState(
        newApiState: FetchState
            .fetching); // Set ApiState to fetching
    try {
      var result = await GetCharactersByIdUseCase(
          _appRepository)
          .call(id);

      currentCharacter = result;

      _setState(
          newApiState:
          FetchState
              .fetched);
    } catch (e) {
      _setState(
          newApiState:
          FetchState
              .error,
          errorMessage:
          e.toString());
      // Set ApiState to error if fetch fails
    }
    // Reset ApiState to idle after 5 seconds
    Future.delayed(
      const Duration(seconds: 5),
          () {
        _setState(
            newApiState:
            FetchState
                .idle);
      },

    );
  }
}