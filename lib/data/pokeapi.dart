import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:pokedex/data/pokemonlist.dart';
import 'package:pokedex/data/pokemoninfo.dart';

const ApiUrl = "https://pokeapi.co/api/v2/";

Future<List<PokemonList>> fetchPokemon() async {
  final response =
      await http.get(path.join(ApiUrl, 'pokemon?offset=0&limit=151'));
  List<PokemonList> pokemonList = new List();
  var decodedJson = jsonDecode(response.body);
  pokemonList = (decodedJson['results'] as List)
      .map((data) => new PokemonList.fromJson(data))
      .toList();
  return pokemonList;
}

Future<PokemonInfo> fetchPokemonInfo(String url) async {
  final response = await http.get(url);
  var decodedJson = jsonDecode(response.body);
  return PokemonInfo.infoFromJson(decodedJson);
}

Future<PokemonInfo> searchPokemon(String name) async {
  final response = await http.get(path.joinAll([ApiUrl, 'pokemon', name]));
  var decodedJson = jsonDecode(response.body);
  return PokemonInfo.infoFromJson(decodedJson);
}
