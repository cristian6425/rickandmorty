import 'package:flutter/material.dart';

class generalDescription extends StatelessWidget {
  final int episodeCuantity;
  final String locationWithMoreCharacters;

  const generalDescription({Key? key, required this.episodeCuantity, required this.locationWithMoreCharacters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: double.maxFinite,
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("La serie en números",style: Theme.of(context).textTheme.subtitle2,),
            Text("$episodeCuantity Número de episodios"),
            Text("Locations con mas personajes: $locationWithMoreCharacters",textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
