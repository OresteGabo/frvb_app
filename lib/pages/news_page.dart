import 'package:frvb/model/article.dart';
import 'package:flutter/material.dart';
import 'package:frvb/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  final String title;
  const NewsPage({Key? key, this.title = "News"}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<Article> _articles = articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.title, style: Theme.of(context).textTheme.headline4),
      ),
      body: Center(
        child: ListView(
          children: _articles.map((article) {
            return _buildItem(article);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return ExpansionTile(
      title: Text(article.text),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Author: ${article.by}'),
            Text('${article.commentsCount} comments'),
            Container(
              color: Colors.green,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.launch),
              ),
            )
          ],
        ),
      ],
    );
  }
}
