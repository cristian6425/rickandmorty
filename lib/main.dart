import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:rickandmorty/data/repositories/character/http_character_repository.dart';
import 'package:rickandmorty/di/Locator.dart';
import 'package:rickandmorty/domain/blocs/Character_bloc/character_bloc.dart';
import 'package:rickandmorty/ui/pages/character/charactersPage.dart';
import 'package:rickandmorty/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: MyThemes.lightTheme,
      home: BlocProvider(
          create: (_) => CharacterBloc(GetIt.instance(),GetIt.instance(),GetIt.instance()),
          child:const  CharactersPage()),
    );
  }
}
