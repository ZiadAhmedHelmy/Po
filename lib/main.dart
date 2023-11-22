import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/veiwModel/bloc/pokemon_cubit.dart';
import 'package:pokemon_app/veiwModel/data/network/dio_helper.dart';
import 'view/splash/PokeWelcome.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonCubit()),
      ],
      child: MaterialApp(
       home: PokeSplash(),
      ),
    );
  }
}
