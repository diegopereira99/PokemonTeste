import 'package:dio/dio.dart';
import 'package:pokemon_teste/app/interfaces/pokemon_repository_interface.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';
import 'package:pokemon_teste/app/models/pokemon_details_model.dart';
import 'package:pokemon_teste/app/shared/constants.dart';

class PokemonRepository extends IPokemonRepositoryInterface{
  
  Dio dio;

  PokemonRepository() {
    this.dio = Dio();
  }

  Future<List<GenericPokemonApiResponse>> getPokemonTypes() async{
    List<GenericPokemonApiResponse> pokemonsType = List();
    Response<Map<String, dynamic>> response = await this.dio.get("${AppConstants.API}/type");
    for (Map<String, dynamic> type in response.data["results"]) {
      pokemonsType.add(GenericPokemonApiResponse.fromJson(type));
    }
    return pokemonsType;    
  }

  Future<List<GenericPokemonApiResponse>> getPokemonsByType(String url) async{
    List<GenericPokemonApiResponse> pokemonsByType = List();
    Response<Map<String, dynamic>> response = await this.dio.get(url);
    for (Map<String, dynamic> pokemon in response.data["pokemon"]) {
      pokemonsByType.add(GenericPokemonApiResponse.fromJson(pokemon["pokemon"]));
    }
    return pokemonsByType;    
  }

  Future<PokemonDetailsModel> getPokemonDetails(String url) async {
    Response<Map<String, dynamic>> response = await this.dio.get(url);
    PokemonDetailsModel pokemonDetail = PokemonDetailsModel.fromJson(
      {
        "weight": response.data["weight"],
        "height": response.data["height"],
        "image": response.data["sprites"]["other"]["official-artwork"]["front_default"] ?? response.data["sprites"]["front_default"],
        "name": response.data["name"],
        "abilities": response.data["abilities"],
      }
    );
    return pokemonDetail;

  }

}