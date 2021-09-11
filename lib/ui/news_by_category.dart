import 'package:flutter/material.dart';
import 'package:news_app_version2/model/articles.dart';
import 'package:news_app_version2/model/category.dart';
import 'package:news_app_version2/repositories/data_service.dart';
import 'package:news_app_version2/utils/theme.dart';
import 'package:news_app_version2/widget/news_item.dart';

class NewsByCategory extends StatefulWidget {
  final  Article article;
  NewsByCategory({required this.article,  required this.categoryName});
  final String categoryName;

  @override
  _NewsByCategoryState createState() => _NewsByCategoryState();
}

class _NewsByCategoryState extends State<NewsByCategory> {

  final RequestByCategory requestByCategory =  RequestByCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: requestByCategory.getNewsByCategory(widget.categoryName),
        builder: (context, snapshot) {
          print(snapshot.data);
        return snapshot.data != null
            ? _listNewsCategory(snapshot.data as List<Article>)
            : Center(child: CircularProgressIndicator());
      },
      ),
    );
  }

  Widget _listNewsCategory( List<Article> articles){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16,),
          Container(
            alignment: Alignment.topLeft,
            child: Text( widget.categoryName + "  News",
                style:titleArticle.copyWith(fontSize:16)),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 16, horizontal: 16
            ),
            child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return NewsItem(
                      article: articles[index] );
                }
            ),
          ),
        ],
      ),
    );
  }
}





