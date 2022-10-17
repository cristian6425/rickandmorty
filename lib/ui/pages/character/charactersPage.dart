import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/blocs/Character_bloc/character_bloc.dart';
import 'package:rickandmorty/ui/pages/character/widgets/generalDescription.dart';
import 'package:rickandmorty/ui/pages/character/widgets/listCharacters.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late CharacterBloc characterBloc;

  @override
  void initState() {
    characterBloc = context.read<CharacterBloc>();
    characterBloc.add(InitialState());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharacterBloc, CharacterState>(
      listener: (context, state) {
        if (state.status == PostStatus.failure && state.errorMessage!="") {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return Stack(
              children: [
                if (state.characters.isNotEmpty)
                  Column(
                    children: [
                      generalDescription(
                          episodeCuantity: state.episodeCuantity,
                          locationWithMoreCharacters:
                              state.locationWithMoreCharacters),
                      const ListCharacters(),
                    ],
                  ),
                if (state.characters.isEmpty &&
                    state.status != PostStatus.initial)
                  const Center(child: Text('no characters')),
                if (state.loading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
