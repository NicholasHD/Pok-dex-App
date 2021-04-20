import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemoninfo.dart';
import 'package:flutter_tags/flutter_tags.dart';

class MoreInfo extends StatelessWidget {
  final String pokeName;
  final PokemonInfo pokemonInfo;
  MoreInfo({this.pokemonInfo, this.pokeName});

  @override
  Widget build(BuildContext context) {
    Map colorPad = {
      'fire': Color.fromARGB(255, 230, 0, 0),
      'water': Color.fromARGB(255, 0, 51, 204),
      'grass': Color.fromARGB(255, 0, 153, 51),
      'normal': Color.fromARGB(255, 173, 173, 133),
      'bug': Color.fromARGB(255, 153, 204, 0),
      'electric': Color.fromARGB(255, 230, 230, 0),
      'fighting': Color.fromARGB(255, 128, 0, 0),
      'flying': Color.fromARGB(255, 153, 153, 255),
      'rock': Color.fromARGB(255, 153, 153, 77),
      'ground': Color.fromARGB(255, 179, 134, 0),
      'poison': Color.fromARGB(255, 128, 0, 128),
      'psychic': Color.fromARGB(255, 255, 26, 198),
      'ghost': Color.fromARGB(255, 92, 0, 230),
      'dark': Color.fromARGB(255, 77, 26, 0),
      'steel': Color.fromARGB(255, 163, 163, 194),
      'ice': Color.fromARGB(255, 51, 204, 255),
      'dragon': Color.fromARGB(255, 153, 102, 255),
      'fairy': Color.fromARGB(255, 255, 153, 255),
    };

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 0, 0),
        appBar: AppBar(
          title: Text(pokemonInfo.nameTemp),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width - 20,
              left: 10.0,
              top: MediaQuery.of(context).size.height * 0.15,
              child: Card(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 0.3,
                  ),
                  Column(
                    children: [
                      Text(
                        pokemonInfo.nameTemp,
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'National No: ${pokemonInfo.id}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Types',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Tags(
                            itemCount: pokemonInfo.types.length,
                            itemBuilder: (int index) {
                              var type = pokemonInfo.types[index];
                              return ItemTags(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                index: index,
                                title: type,
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                                activeColor: colorPad[type],
                                textActiveColor: Colors.white,
                                textColor: Colors.white,
                                color: colorPad[type],
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Height: ${pokemonInfo.height / 10} m',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Weight: ${pokemonInfo.weight / 10} kg',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Abilities',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Tags(
                            itemCount: pokemonInfo.abilities.length,
                            itemBuilder: (int index) {
                              var ability = pokemonInfo.abilities[index];
                              return ItemTags(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                index: index,
                                title: ability,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                ),
                                activeColor: Colors.black38,
                                textActiveColor: Colors.white,
                                textColor: Colors.white,
                                color: Colors.black38,
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${pokemonInfo.nameTemp} In-Game Sprite',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                              image: NetworkImage(
                            pokemonInfo.fsprite,
                          )),
                          Image(
                            image: NetworkImage(pokemonInfo.bsprite),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(pokemonInfo.sprite))),
                ))
          ],
        ));
  }
}
