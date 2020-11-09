import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_teste/app/interfaces/pokemon_repository_interface.dart';
import 'package:pokemon_teste/app/models/pokemon_details_model.dart';

part 'pokemon_detail_controller.g.dart';

@Injectable()
class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  final IPokemonRepositoryInterface repository;

  @observable
  ObservableFuture<PokemonDetailsModel> pokemonDetailFuture;

  _PokemonDetailControllerBase(this.repository);

  void getPokemonDetails(String url) {
    this.pokemonDetailFuture = ObservableFuture(this.repository.getPokemonDetails(url));
  }
}
