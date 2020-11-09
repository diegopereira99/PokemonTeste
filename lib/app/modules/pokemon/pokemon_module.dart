import 'package:pokemon_teste/app/modules/pokemon/pokemon_detail/pokemon_detail_page.dart';

import 'pokemon_detail/pokemon_detail_controller.dart';
import 'package:pokemon_teste/app/modules/pokemon/pokemon_by_type/pokemon_by_type_page.dart';

import 'pokemon_by_type/pokemon_by_type_controller.dart';
import 'package:pokemon_teste/app/repositories/pokemon_repository.dart';

import 'pokemon_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_page.dart';

class PokemonModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PokemonDetailController,
        $PokemonByTypeController,
        $PokemonController,
        Bind((i) => PokemonRepository())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PokemonPage()),
        ModularRouter('/pokemonsByType',
            child: (_, args) => PokemonByTypePage(pokemonType: args.data)),
        ModularRouter('/pokemon',
            child: (_, args) => PokemonDetailPage(pokemon: args.data)),
      ];

  static Inject get to => Inject<PokemonModule>.of();
}
