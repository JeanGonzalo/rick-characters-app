import 'package:flutter/material.dart';
import 'package:ponte_rikoso/src/providers/rick_character_bloc.dart';
import 'package:ponte_rikoso/src/ui/widget/list_rick.dart';
import 'package:provider/provider.dart';

class PagerScreen extends StatelessWidget {
  static const routeName = 'pagerScreen-route';
  @override
  Widget build(BuildContext context) {
    final rickCharacterApi = Provider.of<RickCharacterBloc>(context);
    return Scaffold(
      body: ListRickWidget(
        rickCharacterBloc: rickCharacterApi,
      ),
    );
  }
}

class ListRickWidget extends StatelessWidget {
  //final List<Result> characters;

  const ListRickWidget({
    Key key,
    @required this.rickCharacterBloc,
  }) : super(key: key);

  final RickCharacterBloc rickCharacterBloc;

  @override
  Widget build(BuildContext context) {
    if (rickCharacterBloc.failure != null) {
      return Center(child: Text(rickCharacterBloc.failure.toString()));
    }
    if (rickCharacterBloc.characters == null) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: rickCharacterBloc.characters.length,
      itemBuilder: (BuildContext context, int index) {
        //return Text("${this.news[index].title} \n");
        return Characters(
          results: rickCharacterBloc.characters[index],
          index: index,
          key: UniqueKey(),
        );
      },
    );
  }
}
