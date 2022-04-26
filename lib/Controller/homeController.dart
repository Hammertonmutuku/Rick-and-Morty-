import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_morty_api/Model/character.dart';
import 'package:rick_morty_api/Repository/home-repository.dart';

class HomeControlller {
  final homeApiRespository = HomeRepository();

  Future<List<Results>> getCharacters() async {
    final Response response =  await homeApiRespository.getCharacter();
    List<Results> characters = [];

  if (response.statusCode == 200) {
    final Map dataFromApi = jsonDecode(response.body);
    final List<dynamic> charactersResults =  dataFromApi["results"];

    characters =  charactersResults.map((character) => Results.fromJson(character)).toList();
    return characters;
  }else {
    throw Exception('cant  get characters');
  }
  }
}

final homeController = HomeControlller();