part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}
class getPokemonLoadingState extends PokemonState {}
class getPokemonSuccessState extends PokemonState {}
class getPokemonFeiledState extends PokemonState {}
