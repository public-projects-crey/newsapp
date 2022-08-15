import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'ac8b4c17482e4e2abc88577c44ae78a1';

class NewsService with ChangeNotifier {
  List<Article> headLines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = "$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co";

    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
