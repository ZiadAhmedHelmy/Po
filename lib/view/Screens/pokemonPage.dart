import 'package:flutter/material.dart';
import 'package:pokemon_app/model/PokemonModel.dart';
import 'package:pokemon_app/utils/AppColor.dart';

import '../Component/widgets/item_type.dart';

class pokemonScreen extends StatelessWidget {
  const pokemonScreen({super.key, required this.pokemon});
  final Pokemon? pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${pokemon?.name}",
          style: const TextStyle(fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: AppColor.blue,
      ),
      backgroundColor: AppColor.blue,
      body: Stack(
        alignment: Alignment.center,
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 90),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.backGround),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 20,),
                Text( "${pokemon?.name}",
                    style: const TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),

                Text( "Height :${pokemon?.height}",
                    style: const TextStyle(fontSize: 20 )),

                Text( "Weight :${pokemon?.weight}",
                    style: const TextStyle(fontSize: 20 )),

                //Types
                const Text( "Types",
                    style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),

                Wrap(
                  spacing: 30,
                  children: List.generate(
                    pokemon!.type!.length,
                        (index) => ItemType(text: pokemon?.type![index] , color: Colors.orangeAccent,),
                  ),
                ),
                const Text( "Weaknesses",
                    style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 30,
                  children: List.generate(
                    pokemon!.weaknesses!.length,
                        (index) => ItemType(text: pokemon?.weaknesses![index] , color: Colors.redAccent,),
                  ),
                ),

              ],

            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Hero(
              tag:"${pokemon?.img}",
              child: Image.network("${pokemon?.img}" , scale: 0.7,),
            ),
          ),
        ]
      ),
    );
  }
}
