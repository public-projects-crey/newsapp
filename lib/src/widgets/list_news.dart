import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return New(neww: news[index], index: index);
      },
    );
  }
}

class New extends StatelessWidget {
  final Article neww;
  final int index;

  const New({Key? key, required this.neww, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _TarjetaTopBar(neww: neww, index: index),
      _TarjetaTittle(neww: neww),
      _TarjetaImage(urlImage: neww.urlToImage),
      _TarjetaBody(neww: neww),
      _TarjetaBtns(),
      const SizedBox(height: 10),
      const Divider(),
    ]);
  }
}

class _TarjetaBtns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.star_outline_rounded),
        ),
        const SizedBox(width: 10),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.more),
        )
      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article neww;
  const _TarjetaBody({
    Key? key,
    required this.neww,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      neww.description,
    );
  }
}

class _TarjetaImage extends StatelessWidget {
  final String urlImage;
  const _TarjetaImage({Key? key, required this.urlImage})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50)),
        child: Container(
          child: (urlImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(urlImage),
                )
              : const Image(
                  image: AssetImage('assets/img/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _TarjetaTittle extends StatelessWidget {
  final Article neww;
  const _TarjetaTittle({
    Key? key,
    required this.neww,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        neww.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text('${index + 1}', style: TextStyle(color: myTheme.accentColor)),
          Text(neww.source.name, style: TextStyle(color: myTheme.accentColor))
        ],
      ),
    );
  }
}
