import 'package:flutter/material.dart';
import 'package:ponte_rikoso/src/data/models/character_model.dart';
import 'package:ponte_rikoso/src/ui/shared/theme.dart';

class Characters extends StatelessWidget {
  final Result results;
  final int index;

  const Characters({
    Key key,
    @required this.results,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(results, index),
        _CardTitle(results),
        _CardImage(results),
        _CardBody(results),
        SizedBox(
          height: 10,
        ),
        Divider(),
      ],
    );
  }
}

class _CardBody extends StatelessWidget {
  final Result results;

  const _CardBody(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((results.origin.name != null) ? results.origin.name : ''),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Result results;
  const _CardImage(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
            child: Image(
          image: NetworkImage(results.image),
        )),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Result results;

  const _CardTitle(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        results.name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Result results;
  final int index;
  const _CardTopBar(this.results, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            "${index + 1} ",
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text(
            "${results.location.name}",
          ),
        ],
      ),
    );
  }
}
