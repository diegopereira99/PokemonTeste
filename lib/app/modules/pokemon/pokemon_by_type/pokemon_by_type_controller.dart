import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_teste/app/interfaces/pokemon_repository_interface.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';

part 'pokemon_by_type_controller.g.dart';

@Injectable()
class PokemonByTypeController = _PokemonByTypeControllerBase
    with _$PokemonByTypeController;

abstract class _PokemonByTypeControllerBase with Store {
  
  final IPokemonRepositoryInterface repository;

  @observable
  ObservableFuture<List<GenericPokemonApiResponse>> pokemonsByTypeFuture;

  _PokemonByTypeControllerBase(this.repository);

  void getPokemonsType(String url) {
    this.pokemonsByTypeFuture = ObservableFuture(this.repository.getPokemonsByType(url));
  }
}
