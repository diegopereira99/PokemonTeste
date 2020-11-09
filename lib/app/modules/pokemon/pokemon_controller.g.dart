// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokemonController = BindInject(
  (i) => PokemonController(i<IPokemonRepositoryInterface>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonControllerBase, Store {
  final _$pokemonsTypeFutureAtom =
      Atom(name: '_PokemonControllerBase.pokemonsTypeFuture');

  @override
  ObservableFuture<List<GenericPokemonApiResponse>> get pokemonsTypeFuture {
    _$pokemonsTypeFutureAtom.reportRead();
    return super.pokemonsTypeFuture;
  }

  @override
  set pokemonsTypeFuture(
      ObservableFuture<List<GenericPokemonApiResponse>> value) {
    _$pokemonsTypeFutureAtom.reportWrite(value, super.pokemonsTypeFuture, () {
      super.pokemonsTypeFuture = value;
    });
  }

  @override
  String toString() {
    return '''
pokemonsTypeFuture: ${pokemonsTypeFuture}
    ''';
  }
}
