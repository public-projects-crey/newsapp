import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

//api key: ac8b4c17482e4e2abc88577c44ae78a1

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (value) => navigationModel.actualPage = value,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "For You"),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: "News")
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Tab1Page(),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = new PageController(initialPage: 1);

  int get actualPage => this._actualPage;
  set actualPage(int valor) {
    print("page ${valor}");
    _pageController.animateToPage(
      valor,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    this._actualPage = valor;
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
