import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';
import 'package:pokemon_teste/app/models/pokemon_details_model.dart';
import 'package:pokemon_teste/app/modules/pokemon/pokemon_detail/widgets/ability_widget.dart';
import 'package:pokemon_teste/app/modules/pokemon/pokemon_detail/widgets/info_widget.dart';
import 'package:pokemon_teste/app/shared/custom_appbar.dart';
import 'pokemon_detail_controller.dart';
import 'package:share/share.dart';

class PokemonDetailPage extends StatefulWidget {
  
  final GenericPokemonApiResponse pokemon;
  PokemonDetailPage({@required this.pokemon});

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState
    extends ModularState<PokemonDetailPage, PokemonDetailController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    print(widget.pokemon.url);
    controller.getPokemonDetails(widget.pokemon.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pokemon.name,
      ),
      body: Observer(
        builder: (_) {
          switch (controller.pokemonDetailFuture?.status) {
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
                          controller.getPokemonDetails(widget.pokemon.url);
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
                print(controller.pokemonDetailFuture.value);
                PokemonDetailsModel pokemon = controller.pokemonDetailFuture.value;
                return
                  ListView(
                    children: [
                      Container(
                        color: Colors.grey[200],
                        height: size.height * 0.35,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              pokemon.image,
                              scale: 2.5,
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: IconButton(
                                icon: Icon(Icons.share),
                                onPressed: () async{
                                  await Share.share(
                                    "Nome: ${pokemon.name}\nAltura: ${pokemon.height}\nPeso: ${pokemon.weight},\nHabilidades: ${pokemon.abilities.map((e) => e.name).toList().join(', ')},\nFoto:${pokemon.image}, "
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Informações",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            InfoWidget(title: "Altura", value: pokemon.height),
                            InfoWidget(title: "Peso", value: pokemon.weight),
                            SizedBox(height: 25),
                            Text(
                              "Habilidades",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 5),
                            AbilityWidget(abilities: pokemon.abilities)
                          ],
                        ),
                      )
                    ],
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
}
