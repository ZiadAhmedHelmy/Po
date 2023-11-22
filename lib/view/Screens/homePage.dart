import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_app/veiwModel/bloc/pokemon_cubit.dart';
import 'package:pokemon_app/view/Component/widgets/pokeCard.dart';
import 'package:pokemon_app/view/Screens/pokemonPage.dart';
import '../../utils/AppColor.dart';

class homePage extends StatelessWidget {
  homePage({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = PokemonCubit.get(context);
    return BlocProvider.value(
        value: PokemonCubit.get(context)..getAllPokemon(),
        child: Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset("assets/images/Pokemon.svg" , width: 100,),
            centerTitle: true,
            backgroundColor: AppColor.blue,
          ),
          backgroundColor: AppColor.backGround,
          body: BlocConsumer<PokemonCubit, PokemonState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 2,
                physics: const BouncingScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: List.generate(
                    PokemonCubit.get(context).pokeList.length,
                    (index) => PokeCard(
                          pokemon: cubit.pokeList[index],
                      onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => pokemonScreen(pokemon:cubit.pokeList[index])));
                      },
                        )),
              );
            },
          ),
        ));
  }
}
