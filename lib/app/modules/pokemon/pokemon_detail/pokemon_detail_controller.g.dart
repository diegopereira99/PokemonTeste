// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokemonDetailController = BindInject(
  (i) => PokemonDetailController(i<IPokemonRepositoryInterface>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on _PokemonDetailControllerBase, Store {
  final _$pokemonDetailFutureAtom =
      Atom(name: '_PokemonDetailControllerBase.pokemonDetailFuture');

  @override
  ObservableFuture<PokemonDetailsModel> get pokemonDetailFuture {
    _$pokemonDetailFutureAtom.reportRead();
    return super.pokemonDetailFuture;
  }

  @override
  set pokemonDetailFuture(ObservableFuture<PokemonDetailsModel> value) {
    _$pokemonDetailFutureAtom.reportWrite(value, super.pokemonDetailFuture, () {
      super.pokemonDetailFuture = value;
    });
  }

  @override
  String toString() {
    return '''
pokemonDetailFuture: ${pokemonDetailFuture}
    ''';
  }
}
