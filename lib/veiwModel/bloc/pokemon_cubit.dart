import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/model/PokemonModel.dart';
import 'package:pokemon_app/veiwModel/data/network/dio_helper.dart';
import 'package:pokemon_app/veiwModel/data/network/end_points.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  static PokemonCubit get(context) => BlocProvider.of(context);

   List<Pokemon> pokeList = [];

  Future<void> getAllPokemon() async{
    emit(getPokemonLoadingState());
    await DioHelper.get(endPoint: EndPoints.PokeMons).then((value) {
      print(value.data);
      List<dynamic> jsonData = jsonDecode(value.data)["pokemon"];
      pokeList = jsonData.map((pokemonData) => Pokemon.fromJson(pokemonData)).toList();
      emit(getPokemonSuccessState());
    }).catchError((error){
      print(error);
      emit(getPokemonFeiledState());
      throw error;
    });

  }

}
