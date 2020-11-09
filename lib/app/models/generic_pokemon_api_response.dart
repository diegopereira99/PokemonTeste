class GenericPokemonApiResponse {
  String name;
  String url;

  GenericPokemonApiResponse({this.name, this.url});

  GenericPokemonApiResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
