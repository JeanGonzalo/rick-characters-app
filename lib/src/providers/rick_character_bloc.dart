import 'package:flutter/material.dart';

import 'package:ponte_rikoso/src/data/models/character_model.dart';
import 'package:ponte_rikoso/src/data/network/failure_error_handler.dart';
import 'package:ponte_rikoso/src/data/repositories/remote_rick_repository.dart';
import 'package:ponte_rikoso/src/data/repositories/rick_character_repository.dart';

class RickCharacterBloc extends ChangeNotifier {
  RickCharacterRepository repository = RemoteCharacterRepository();

  List<Result> _characters;

  List<Result> get characters => _characters;

  Failure _failure;
  Failure get failure => _failure;

  void retrieveCharacter() async {
    try {
      _characters = await repository.fetchCharacters();
    } on Failure catch (e) {
      _failure = e;
    }
    notifyListeners();
  }
}
