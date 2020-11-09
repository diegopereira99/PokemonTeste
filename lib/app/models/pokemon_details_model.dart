import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';

class PokemonDetailsModel {
  String name;
  String image;
  String height;
  String weight;
  List<GenericPokemonApiResponse> abilities;

  PokemonDetailsModel(
      {this.name,
      this.image,
      this.height,
      this.weight,
      this.abilities});

  PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    height = json['height'].toString();
    weight = json['weight'].toString();
    if (json['abilities'] != null) {
      abilities = List<GenericPokemonApiResponse>();
      json['abilities'].forEach((v) {
        abilities
            .add(GenericPokemonApiResponse.fromJson(v["ability"]));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['height'] = this.height;
    data['weight'] = this.weight;
    if (this.abilities != null) {
      data['abilities'] =
          this.abilities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}