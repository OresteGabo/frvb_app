import 'package:frvb/constants.dart';
import 'package:frvb/model/article.dart';
import 'package:flutter/material.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:frvb/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          flexibleSpace: Image(
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.luminosity,
            //opacity: ,
            image: AppVars.palette
                .getDecorationImage(themeProvider.isDarkMode)
                .image,
            fit: BoxFit.cover,
          ),
          //backgroundColor: const Color(0xa033302f),
          elevation: 0,
          bottom: const TabBar(
            labelColor: Colors.white, //<-- selected text color
            unselectedLabelColor: Colors.grey,

            indicatorColor: Colors.white,
            indicator: BoxDecoration(
                //color: Colors.grey,
                ),
            tabs: [
              Tab(
                text: 'Top stories',
              ),
              Tab(
                text: 'Saved Stories',
              ),
              Tab(
                text: 'All Stories',
              ),
            ],
          ),
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //title:
          //  Text(widget.title, style: Theme.of(context).textTheme.headline4),
        ),
        body: TabBarView(
          children: [
            Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    //_articles.removeAt(0);
                  });
                },
                child: Center(
                  child: ListView(
                    children: _articles.map((article) {
                      return _buildItem(article);
                    }).toList(),
                  ),
                ),
              ),
            ),
            const Center(child: Text('Saved stories will be here')),
            const Center(
                child: Text(
                    'All storied, sorted by time of articles, and the number of likes')),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    final Uri _url = Uri.parse(article.domain);
    bool _isSelected = true;
    Color notSelectedColor = Colors.black;
    Color selectedColor = Colors.orangeAccent;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
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
                    
                  },
                  icon: const Icon(Icons.launch),
                ),
              )*/
              Container(
                color: Colors.green,
                child: InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Read article',
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _launchUrl(_url);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
