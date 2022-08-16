import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/catergory_model.dart';
import '../models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'ac8b4c17482e4e2abc88577c44ae78a1';

class NewsService with ChangeNotifier {
  List<Article> headLines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String valor) {
    _selectedCategory + valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  NewsService() {
    getTopHeadlines();

    categories.forEach((element) {
      categoryArticles[element.name] = [];
    });
  }

// business entertainment general health science sports technology
  getTopHeadlines() async {
    final url = "$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co";

    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.length > 0) {
      return categoryArticles[category];
    }
    final url =
        "$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co&category=$category";

    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();
  }
}
