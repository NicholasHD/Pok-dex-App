import 'package:pokedex/data/pokeapi.dart';
import 'package:pokedex/data/pokemoninfo.dart';

class PokemonList {
  String name;
  String url;
  Future<PokemonInfo> info;
  PokemonList({this.name, this.info, this.url});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    String nametemp =
        '${json['name'][0].toUpperCase()}${json['name'].substring(1)}';
    return PokemonList(name: nametemp, url: json['url']);
  }

  Future<PokemonInfo> getPokemonInfo() {
    return fetchPokemonInfo(url);
  }
}
