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
          children: _articles.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    //if (e.text.startsWith("Data")) return null;
    return Padding(
      key: Key(article.text),
      padding: const EdgeInsets.all(18.0),
      child: ExpansionTile(
        //subtitle:
        title: Text(
          article.text,
          style: const TextStyle(fontSize: 24.0),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${article.commentsCount} comments'),
              IconButton(
                color: Colors.orangeAccent,
                icon: const Icon(Icons.launch),
                onPressed: () async {
                  Uri _url = Uri.parse(article.domain);
                  if (await canLaunchUrl(_url)) {
                    print("Url is going to be lauched");
                    launchUrl(_url);
                  } else {
                    print("Url has a very big issue");
                  }
                },
                //child: Text("Open"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
