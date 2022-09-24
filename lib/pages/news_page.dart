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
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            //_articles.removeAt(0);
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 18.0),
          child: Center(
            child: ListView(
              children: _articles.map((article) {
                return _buildItem(article);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    final Uri _url = Uri.parse(article.domain);
    bool _isSelected = true;
    Color notSelectedColor = Colors.black;
    Color selectedColor = Colors.orangeAccent;
    return ExpansionTile(
      key: Key(article.domain),
      title: Text(article.text),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //this button will be used to report the article
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.report),
                        title: Text('Report'),
                        subtitle:
                            Text('Reported an articles will be inspected'),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help'),
                        subtitle: Text("more information about this article"),
                      ),
                    ),
                    /*
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.article),
                        title: Text('Item 3'),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(child: Text('Item A')),
                    const PopupMenuItem(child: Text('Item B')),*/
                  ],
                ),
                IconButton(
                    color: _isSelected ? selectedColor : notSelectedColor,
                    padding: const EdgeInsets.only(right: 0),
                    onPressed: () {
                      setState(() {
                        if (_isSelected == true) {
                          _isSelected = false;
                          article.likesCount--;
                        } else {
                          _isSelected = true;
                          article.likesCount++;
                        }
                      });
                    },
                    icon: const Icon(Icons.favorite)),
                Text('${article.likesCount} likes'),
              ],
            ),
            //Text('Author: ${article.by}'),
            Text('${article.commentsCount} comments'),
            /*Container(
              color: Colors.green,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _launchUrl(_url);
                  });
                },
                icon: const Icon(Icons.launch),
              ),
            )*/
            Container(
              color: Colors.green,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Read article',
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
