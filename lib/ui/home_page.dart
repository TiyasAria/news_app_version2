import 'package:flutter/material.dart';
import 'package:news_app_version2/model/articles.dart';
import 'package:news_app_version2/model/category.dart';
import 'package:news_app_version2/repositories/data_catagories.dart';
import 'package:news_app_version2/repositories/data_service.dart';
import 'package:news_app_version2/ui/news_page.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  News news = News();
  late List<Category> categories ;

  @override
  void initState() {
    super.initState();
    categories = getCatagories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: news.getNews(),
          builder: (context, snapshot){
           return snapshot.data != null ?
           NewsPage( snapshot.data as List<Article> , categories)
           : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
