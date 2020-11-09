import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';
import 'package:pokemon_teste/app/models/pokemon_details_model.dart';

abstract class IPokemonRepositoryInterface {

  Future<List<GenericPokemonApiResponse>> getPokemonTypes();
  Future<List<GenericPokemonApiResponse>> getPokemonsByType(String url);
  Future<PokemonDetailsModel> getPokemonDetails(String url);

}