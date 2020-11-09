import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';
import 'package:pokemon_teste/app/shared/custom_appbar.dart';
import 'pokemon_controller.dart';

class PokemonPage extends StatefulWidget {
  
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends ModularState<PokemonPage, PokemonController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Tipos de Pokemons"),
      body: Observer(
        builder: (_) {
          switch (controller.pokemonsTypeFuture?.status) {
            case FutureStatus.pending:
              return
                Center(
                  child: CircularProgressIndicator(),
                );
              break;
            case FutureStatus.rejected:
              return
                Center(
                  child: Column(
                    children: [
                      Text("Erro ao buscar tipos de pokemons"),
                      FlatButton(
                        onPressed: () {
                          controller.getPokemonsType();
                        }, 
                        child: Text(
                          "Tentar novamente"
                        )
                      )
                    ],
                  ),
                );
              break;
              case FutureStatus.fulfilled:
                return
                  ListView(
                    children: controller.pokemonsTypeFuture.value.map((GenericPokemonApiResponse pokemonType) {
                      return
                        this._buildPokemonTypeTile(pokemonType);
                    }).toList(),
                  );
                break;
            default:
              return
                Container();
          }
        },
      )
    );
  }

  Widget _buildPokemonTypeTile(GenericPokemonApiResponse pokemonType) {
    return
      ListTile(
        onTap: () {
          Modular.to.pushNamed('/pokemonsByType', arguments: pokemonType);
        },
        title: Text(
          pokemonType.name,
          style: TextStyle(
            fontFamily: "Poppins"
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 12,
        ),
      );
  }
}
