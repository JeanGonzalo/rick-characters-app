import 'dart:async';

import 'package:ponte_rikoso/src/data/models/character_model.dart';

abstract class RickCharacterRepository {
  Future<List<Result>> fetchCharacters();
}
