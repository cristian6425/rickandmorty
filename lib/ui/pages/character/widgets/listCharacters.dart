import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/domain/blocs/Character_bloc/character_bloc.dart';
import 'package:rickandmorty/ui/pages/character/widgets/characterCard.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  final _scrollController = ScrollController();
  late CharacterBloc characterBloc;


  @override
  void initState() {
    characterBloc = context.read<CharacterBloc>();
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  void _onScroll() {
    if (_isBottom) context.read<CharacterBloc>().add(GetCharacters());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
  _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    int cantidadCuadros = (mediaQuery.size.width / 450).round();

    return BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          return Flexible(
            child: GridView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cantidadCuadros,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 16 / 7,
                ),
                itemCount: state.characters.length,
                itemBuilder: (BuildContext context, index) {
                  return CharacterCard(character: state.characters[index]);
                }),
          );
        });
  }
}
