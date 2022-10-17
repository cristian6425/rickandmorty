import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/ui/pages/character/widgets/ImageCharacter.dart';

class CharacterPage extends StatelessWidget {
  final Character character;

  const CharacterPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
            width: 500,
            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Detalle",style: Theme.of(context).textTheme.headline5,),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child:
                           CharacterImage(imageUrl: character.image)),
                    Text(character.name,style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,),
                    Padding(
                      padding: const EdgeInsets.only( top: 32.0),
                      child:  SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("- Gender: ${character.gender}"),
                            Text("- Origin: ${character.origin.name}"),
                            Text("- Location: ${character.location.name}"),
                            Text("- Number of episodes: ${character.episode.length.toString()}"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
