import 'dart:io';

import 'package:ponte_rikoso/src/data/models/character_model.dart';
import 'package:ponte_rikoso/src/data/network/failure_error_handler.dart';
import 'package:ponte_rikoso/src/data/network/rick_api.dart';
import 'package:ponte_rikoso/src/data/repositories/rick_character_repository.dart';

class RemoteCharacterRepository extends RickCharacterRepository {
  @override
  Future<List<Result>> fetchCharacters() async {
    try {
      final rickApi = RickCharacterApi();
      return await rickApi.getCharacters();
    } on SocketException {
      throw Failure("No internet connection", 400);
    } on HttpException {
      throw Failure("Not found request", 404);
    } on FormatException {
      throw Failure("Invalid JSON format", 666);
    } catch (e) {
      throw Failure("Unknown error", 888);
    }
  }
}
