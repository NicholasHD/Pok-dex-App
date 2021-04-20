class PokemonInfo {
  String sprite;
  String fsprite;
  String bsprite;
  String nameTemp;
  int id;
  int height;
  int weight;
  List<String> abilities;
  List<String> types;

  PokemonInfo(
      {this.sprite,
      this.fsprite,
      this.bsprite,
      this.nameTemp,
      this.id,
      this.height,
      this.weight,
      this.abilities,
      this.types});

  factory PokemonInfo.infoFromJson(Map<String, dynamic> json) {
    List<String> abilitiestemp = (json['abilities'] as List)
        .map((data) => data['ability']['name'].toString())
        .toList();

    List<String> typestemp = (json['types'] as List)
        .map((data) => data['type']['name'].toString())
        .toList();

    return PokemonInfo(
        sprite: json['sprites']['other']['official-artwork']['front_default'],
        fsprite: json['sprites']['front_default'],
        bsprite: json['sprites']['back_default'],
        nameTemp:
            '${json['name'][0].toUpperCase()}${json['name'].substring(1)}',
        height: json['height'],
        weight: json['weight'],
        id: json['id'],
        abilities: abilitiestemp,
        types: typestemp);
  }
}
