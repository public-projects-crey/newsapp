import 'package:flutter/material.dart';
import 'package:newsapp/src/models/catergory_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListCategory(),
            Expanded(
                child: ListNews(news: newService.getArticleCategorySelected)),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              _CategoryBtn(category: categories[index]),
              const SizedBox(height: 5),
              Text(
                  '${categoryName[0].toUpperCase()}${categoryName.substring(1)}'),
            ]),
          );
        },
      ),
    );
  }
}

class _CategoryBtn extends StatelessWidget {
  final Category category;

  const _CategoryBtn({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedCategory = Provider.of<NewsService>(context).selectedCategory;
    return GestureDetector(
      onTap: () {
        print(category.name);
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: selectedCategory == category.name
              ? myTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
