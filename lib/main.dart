import 'package:flutter/material.dart';
import 'package:pokedex/data/pokeapi.dart';
import 'package:pokedex/screen/moreinfo.dart';
import 'screen/gridview.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        fontFamily: 'VCR',
        primaryColor: Color.fromARGB(255, 102, 0, 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  SearchBar searchBar;
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text(
        'Pokédex',
        style: TextStyle(fontFamily: 'PocketMonk'),
      ),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  HomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: (name) async {
          String nameSearch = '${name[0].toUpperCase()}${name.substring(1)}';
          try {
            var pokemonSearch = await searchPokemon(name);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoreInfo(
                        pokemonInfo: pokemonSearch,
                        pokeName: nameSearch,
                      )),
            );
          } catch (e) {
            getAlert(context);
          }
        },
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: searchBar.build(context),
      backgroundColor: Color.fromARGB(255, 102, 0, 0),
      body: GridViewWidget(),
    );
  }
}

Future<void> getAlert(BuildContext c) async {
  return showDialog<void>(
    context: c,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Cant Find Pokemon'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Pokemon Name or ID Not Found.'),
              Text('Please Try Again.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
