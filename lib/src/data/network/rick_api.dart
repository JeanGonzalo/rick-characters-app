import 'package:http/http.dart' as http;
import 'package:ponte_rikoso/src/data/models/character_model.dart';

const _ENDPOINT = 'https://rickandmortyapi.com/api';

class RickCharacterApi {
  // var client = new http.Client();
  //List<Result> characters = [];

  Future<List<Result>> getCharacters() async {
    final data = await http.get("$_ENDPOINT/character/");
    final parsed = characterApiFromJson(data.body);
    return parsed.results;
  }
}
