import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/ui/pages/character/characterPage.dart';
import 'package:rickandmorty/ui/pages/character/widgets/ImageCharacter.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: InkWell(
                onTap: detailOnClink,
                child: CharacterImage(
                  imageUrl: widget.character.image,
                ),
              )),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: const Color(0xFFF1F2F3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap:detailOnClink,
                              child: Text(widget.character.name,style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis,)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 16,
                                  color: Colors.green,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(widget.character.status, overflow: TextOverflow.ellipsis),
                                )
                              ],
                            ),
                          ),
                          Text(widget.character.species, overflow: TextOverflow.ellipsis),
                        ],
                      ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: detailOnClink,
                          child: const  Text("Detalle",),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void detailOnClink(){
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharacterPage(
            character: widget.character,
          ),
        ),
      );
    }
  }
}
