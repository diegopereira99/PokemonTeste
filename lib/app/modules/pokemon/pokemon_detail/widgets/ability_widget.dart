import 'package:flutter/material.dart';
import 'package:pokemon_teste/app/models/generic_pokemon_api_response.dart';
import 'package:pokemon_teste/app/shared/constants.dart';
import 'package:pokemon_teste/app/shared/extensions.dart';

class AbilityWidget extends StatelessWidget {

  final List<GenericPokemonApiResponse> abilities;

  AbilityWidget({@required this.abilities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: this.abilities.length > 0 ? Wrap(
        runSpacing: 5,
        spacing: 5,
        children: this.abilities.mapIndexed((e, i){
          return 
            Chip(
              backgroundColor: AppConstants.abilitiesColor[i] != null ? 
              AppConstants.abilitiesColor[i] : AppConstants.abilitiesColor[AppConstants.abilitiesColor.length -1],
              label: Text(
                e.name,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            );
        }).toList(),
      ): Text(
        "Nenhuma habilidade encontrada",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 15
        ),
        textAlign: TextAlign.center,
      )
    );
  }
}