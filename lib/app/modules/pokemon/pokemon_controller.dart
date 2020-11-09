import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_teste/app/interfaces/pokemon_repository_interface.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';

part 'pokemon_controller.g.dart';

@Injectable()
class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  
  final IPokemonRepositoryInterface repository;

  @observable
  ObservableFuture<List<GenericPokemonApiResponse>> pokemonsTypeFuture;

  _PokemonControllerBase(this.repository) {
    this.getPokemonsType();
  }

  void getPokemonsType() {
    this.pokemonsTypeFuture = ObservableFuture(this.repository.getPokemonTypes());
  }
}
