import 'dart:convert';

import 'package:digitalk_flutter_test_task/core/error/exception.dart';
import 'package:digitalk_flutter_test_task/core/url/app_url.dart';
import 'package:digitalk_flutter_test_task/features/characters/data/model/characters_model.dart';
import 'package:http/http.dart' as http;

abstract class CharactersDatasource {
  Future<List<CharactersModelResults>> getCharacters(int page);
}

class CharactersDatasourceImpl implements CharactersDatasource {
  final http.Client client;

  CharactersDatasourceImpl(this.client);

  @override
  Future<List<CharactersModelResults>> getCharacters(int page) async {
    final response = await client.get(
      Uri.parse('$BASE_URL$CHARACTER_ENDPOINT?page=$page'),
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return (decodedJson['results'] as List)
          .map((e) => CharactersModelResults.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}

// final charactersModel = CharactersModel.fromJson(decodedJson);
// return charactersModel;
