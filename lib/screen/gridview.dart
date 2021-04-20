import 'package:pokedex/data/pokeapi.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemonlist.dart';
import 'package:pokedex/screen/moreinfo.dart';

class GridViewWidget extends StatefulWidget {
  @override
  GridViewWidgetState createState() => GridViewWidgetState();
}

class GridViewWidgetState extends State<GridViewWidget> {
  Future<List<PokemonList>> pokemons;
  @override
  void initState() {
    super.initState();
    pokemons = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<PokemonList>>(
        future: pokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var pokemonList = snapshot.data[index];
                  return FutureBuilder(
                      future: pokemonList.getPokemonInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var pokemonSprite = snapshot.data;
                          return InkWell(
                            onTap: () async {
                              var pokemonInf =
                                  await pokemonList.getPokemonInfo();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreInfo(
                                          pokemonInfo: pokemonInf,
                                          pokeName: pokemonList.name,
                                        )),
                              );
                            },
                            child: Card(
                              color: Colors.red[50],
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        NetworkImage(pokemonSprite.sprite),
                                  ),
                                  Text(
                                    pokemonList.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 102, 0, 0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      });
                });
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
