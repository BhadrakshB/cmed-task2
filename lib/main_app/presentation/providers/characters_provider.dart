import 'package:flutter/cupertino.dart';
import 'package:task2/main_app/domain/repositories/app_repository.dart';

import '../../data/data_sources/characters_data_source.dart';
import '../../data/repositories/app_repository_impl.dart';

enum State {
  idle,
  fetching,
  error,
}

class CharactersProvider extends ChangeNotifier {
  late final AppRepository _appRepository;

  CharactersProvider()
      : _appRepository =
  AppRepositoryImpl(
      CharactersDataSource());

  void _setState({
    required State
    newState,
    String errorMessage = '',
    String successMessage =
    '',
  }) {
    _downloadState = newState;
    _errorMessage =
        errorMessage;
    _successMessage =
        successMessage;
    notifyListeners();
  }

  State
  _downloadState =
      State.idle;
  String _errorMessage = '';
  String _successMessage = '';

  // Getters for current state and error message
  State
  get downloadState =>
      _downloadState;

  String get errorMessage =>
      _errorMessage;

  String get successMessage =>
      _successMessage;
}