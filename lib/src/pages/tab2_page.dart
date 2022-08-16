import 'package:flutter/material.dart';
import 'package:newsapp/src/models/catergory_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: _ListCategory()),
          ],
        ),
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
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
          color: Colors.black54,
        ),
      ),
    );
  }
}
