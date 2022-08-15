import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

import '../widgets/list_news.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newService.headLines.length == 0)
          ? const Center(child: CircularProgressIndicator())
          : ListNews(news: newService.headLines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
