import 'package:timeago/timeago.dart' as timeago ;
import 'package:flutter/material.dart';
import 'package:news_app_version2/model/articles.dart';
import 'package:news_app_version2/ui/detail_page.dart';
import 'package:news_app_version2/utils/theme.dart';

class NewsItem extends StatelessWidget {

  final Article article;

  NewsItem({
    required this.article,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)
            => DetailPage(
                article: article,
            ),

        )
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: edgeDetail),
       width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                article.urlToImage,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: Container(
                  width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: titleArticle.copyWith(
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined, size: 12,
                              ),
                              SizedBox(width: 3,),
                              Container(
                                width: 70 ,
                                child: Text(
                                    timeUntil(DateTime.parse(article.publishedAt)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                    fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person, size: 12,
                              ),
                              SizedBox(width: 3,),
                              Container(
                                width: 70,
                                child: Text(
                                    article.author,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                    fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
            ),
            Icon(Icons.bookmark_border_rounded)
          ],
        ),
      ),
    );
  }

  String timeUntil(DateTime parse){
    return  timeago.format(parse, allowFromNow: true, locale: 'en');
  }

}
