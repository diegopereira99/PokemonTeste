// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_by_type_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokemonByTypeController = BindInject(
  (i) => PokemonByTypeController(i<IPokemonRepositoryInterface>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonByTypeController on _PokemonByTypeControllerBase, Store {
  final _$pokemonsByTypeFutureAtom =
      Atom(name: '_PokemonByTypeControllerBase.pokemonsByTypeFuture');

  @override
  ObservableFuture<List<GenericPokemonApiResponse>> get pokemonsByTypeFuture {
    _$pokemonsByTypeFutureAtom.reportRead();
    return super.pokemonsByTypeFuture;
  }

  @override
  set pokemonsByTypeFuture(
      ObservableFuture<List<GenericPokemonApiResponse>> value) {
    _$pokemonsByTypeFutureAtom.reportWrite(value, super.pokemonsByTypeFuture,
        () {
      super.pokemonsByTypeFuture = value;
    });
  }

  @override
  String toString() {
    return '''
pokemonsByTypeFuture: ${pokemonsByTypeFuture}
    ''';
  }
}
