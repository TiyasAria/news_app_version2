import 'package:flutter/material.dart';
import 'package:news_app_version2/model/articles.dart';
import 'package:news_app_version2/model/category.dart';
import 'package:news_app_version2/utils/theme.dart';
import 'package:news_app_version2/widget/category_item.dart';
import 'package:news_app_version2/widget/news_item.dart';
import 'package:news_app_version2/widget/news_item_horizontal.dart';
import 'news_by_category.dart';

class NewsPage extends StatefulWidget {
  final List<Article> articles;
  final List<Category> categories;


  NewsPage( this.articles, this.categories, );

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    var index;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20, right: 20, top: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          image: DecorationImage(
                              image: AssetImage('asset/pp.jpeg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width:10),
                    Text('10 Juni 2021', style: authorDateArticle.copyWith(
                      fontSize: 14,
                    ),)
                  ],
                ),
                Icon(
                  Icons.search,
                  size: 24,
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Text('Breaking News', style: titleHome,)),
          //ini untuk top headlinenya gitu
          Container(
            margin: EdgeInsets.only(
              left: 20
            ),
            height: 200,
            child: PageView.builder(
              itemCount: widget.articles.length,
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                itemBuilder: (context, index){
                  return NewsHeadLine(
                      article : widget.articles[index]
                  );
                }
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 30, right: 30),
          //   height: 330,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(30),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Color(0xff091F33).withOpacity(0.04),
          //         offset: Offset(0, 3),
          //         spreadRadius: 4,
          //         blurRadius: 50,
          //       )
          //     ]
          //   ),
          //   child: Column(
          //     children: [
          //       ClipRRect(
          //           child: Image.network(
          //             widget.articles[index].urlToImage,
          //             height: 215,),
          //         borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(30),
          //           bottomRight: Radius.circular(30)
          //         ),
          //       ),
          //       SizedBox(height: 10,),
          //       Container(
          //         width: 260,
          //         margin: EdgeInsets.only(left: 20),
          //         child: Text(widget.articles[index].title,
          //         style: titleArticle.copyWith(
          //           fontSize: 18,
          //         ),
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //       SizedBox(height: 17),
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 20),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Icon(
          //                   Icons.account_circle,
          //                   size: 25,
          //                 ),
          //                 SizedBox(width: 10,),
          //                 Text(widget.articles[index].author,
          //                   style: authorDateArticle.copyWith(
          //                       fontSize: 14
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Container(
          //               width: 72,
          //               child: Text(widget.articles[index].publishedAt,
          //               style: authorDateArticle.copyWith(
          //                 fontSize: 12
          //               ),
          //                 maxLines: 1,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(height: 5,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Text('Category', style: titleArticle.copyWith(
                fontSize: 18
              ),)),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
           height: 70,
           child: ListView.builder(
             itemCount: widget.articles.length,
             scrollDirection: Axis.horizontal,
               itemBuilder: (context,index) {
                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => NewsByCategory(
                           article : widget.articles[index],
                           categoryName: widget.categories[index].categoryName,
                         )));
                   },
                      child: CategoryItem(
                       imgUrl: widget.categories[index].imgUrl,
                       categoryName: widget.categories[index].categoryName),
                 );
               }
           ),
          ),
          SizedBox(height: 5),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: Text('Top Headline', style: titleArticle.copyWith(
                  fontSize: 18
              ),)),
          SizedBox(height: 10,),
          //ini list article
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: widget.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return NewsItem(
                   article: widget.articles[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
