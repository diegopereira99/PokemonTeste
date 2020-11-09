import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';
import 'package:pokemon_teste/app/shared/custom_appbar.dart';
import 'pokemon_by_type_controller.dart';

class PokemonByTypePage extends StatefulWidget {
  
  final GenericPokemonApiResponse pokemonType;

  PokemonByTypePage({@required this.pokemonType});

  @override
  _PokemonByTypePageState createState() => _PokemonByTypePageState();
}

class _PokemonByTypePageState
    extends ModularState<PokemonByTypePage, PokemonByTypeController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.getPokemonsType(widget.pokemonType.url);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pokemonType.name,
      ),
      body: Observer(
        builder: (_) {
          switch (controller.pokemonsByTypeFuture?.status) {
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
                          controller.getPokemonsType(widget.pokemonType.url);
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
                if(controller.pokemonsByTypeFuture.value.length > 0) {
                  return
                  ListView(
                    children: controller.pokemonsByTypeFuture.value.map((GenericPokemonApiResponse pokemon) {
                      return
                        this._buildPokemonTypeTile(pokemon);
                    }).toList(),
                  );
                }else {
                  return
                    Center(
                      child: Text(
                        "Nenhum pokemon encontrado para esse tipo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),
                      ),
                    );
                }
                
                break;
            default:
              return
                Container();
          }
        },
      )
    );
  }
  
  Widget _buildPokemonTypeTile(GenericPokemonApiResponse pokemon) {
    return
      ListTile(
        onTap: () {
          Modular.to.pushNamed('/pokemon', arguments: pokemon);
        },
        title: Text(
          pokemon.name,
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
