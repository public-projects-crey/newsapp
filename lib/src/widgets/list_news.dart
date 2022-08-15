import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return New(
          neww: this.news[index],
          index: index,
        );
      },
    );
  }
}

class New extends StatelessWidget {
  final Article neww;
  final int index;

  New({
    Key? key,
    required this.neww,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _TarjetaTopBar(neww: neww, index: index),
    ]);
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article neww;
  final int index;

  const _TarjetaTopBar({
    Key? key,
    required this.neww,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text('${index + 1}', style: TextStyle(color: myTheme.accentColor)),
          Text('${neww.source.name}',
              style: TextStyle(color: myTheme.accentColor))
        ],
      ),
    );
  }
}
