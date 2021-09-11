import 'package:flutter/material.dart';
import 'package:news_app_version2/model/articles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(widget.article.urlToImage,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,),
            ListView(
              children: [
                SizedBox(height: 328,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      IconButton(icon: Icon(Icons.arrow_back),
                          onPressed: (){
                            Navigator.pop(context);
                          },padding: EdgeInsets.only(bottom: 6)
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
