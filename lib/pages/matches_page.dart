import 'package:flutter/material.dart';
import 'package:frvb/model/competition.dart';
import 'package:frvb/model/match.dart';
import 'package:badges/badges.dart';
import 'package:frvb/pages/main_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:frvb/widgets/competitionWidget.dart';
import 'package:frvb/widgets/match_card.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  String _selectedCompetition = competitions[0].name;
  Match _selectedMatch = matchCards[0].match;
  bool _slideupPanelUp = false;
  final panelController = PanelController();
  int nberOfFavorites = favoriteMatches.length;

  @override
  /*Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    final panelHeightOpened = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          color: Colors.green,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(
            Icons.home_rounded,
            color: Colors.grey,
          ),
        ),
        title: Text("Matches", style: Theme.of(context).textTheme.headline6),
        actions: [
          IconButton(
            icon: Badge(
              badgeContent: Text(
                nberOfFavorites.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(
                Icons.bookmark,
              ),
            ),
            tooltip: 'Sort matches according to your favorite teams',
            color: Colors.grey,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'This button will help us to sort out from bookmarked teams only')));
            },
          ),
          //Icons.circle_notifications_rounded,
          IconButton(
            icon: Badge(
              badgeContent: const Text(
                "9",
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.circle_notifications_rounded),
            ),
            tooltip: 'Show Snackbar',
            color: Colors.grey,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SlidingUpPanel(
          controller: panelController,
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpened,
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          backdropEnabled: true,
          backdropColor: Colors.black,
          backdropOpacity: 0.5,
          //color: Colors.green,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            panelController: panelController,
            match: _selectedMatch,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 14, top: 32, right: 14),
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: competitions
                        .map(
                          (e) => InkWell(
                              onTap: () => setState(() {
                                    _selectedCompetition = e.name;
                                  }),
                              child: CompetitionWidget(
                                  image: e.images,
                                  name: e.name,
                                  isSelected: e.name == _selectedCompetition)),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: matchCards.map(
                        (e) {
                          return InkWell(
                              onTap: () => setState(() {
                                    _selectedMatch = e.match;
                                    _slideupPanelUp = !_slideupPanelUp;
                                  }),
                              child: MatchCard(
                                  match: e.match,
                                  isSelected: e.match == _selectedMatch));
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }*/
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    final panelHeightOpened = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: competitions.map(
            (e) {
              return InkWell(
                  child: Tab(
                text: e.name,
              ));
            },
          ).toList(),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          color: Colors.green,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(
            Icons.home_rounded,
            color: Colors.grey,
          ),
        ),
        title: Text("Matches", style: Theme.of(context).textTheme.headline6),
        actions: [
          IconButton(
            icon: Badge(
              badgeContent: Text(
                nberOfFavorites.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(
                Icons.bookmark,
              ),
            ),
            tooltip: 'Sort matches according to your favorite teams',
            color: Colors.grey,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'This button will help us to sort out from bookmarked teams only')));
            },
          ),
          //Icons.circle_notifications_rounded,
          IconButton(
            icon: Badge(
              badgeContent: const Text(
                "9",
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.circle_notifications_rounded),
            ),
            tooltip: 'Show Snackbar',
            color: Colors.grey,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SlidingUpPanel(
          controller: panelController,
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpened,
          parallaxEnabled: true,
          parallaxOffset: 0.2,
          backdropEnabled: true,
          backdropColor: Colors.black,
          backdropOpacity: 0.5,
          //color: Colors.green,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            panelController: panelController,
            match: _selectedMatch,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 14, top: 32, right: 14),
            child: Column(
              children: [
                /*SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: competitions
                        .map(
                          (e) => InkWell(
                            onTap: () => setState(() {
                              _selectedCompetition = e.name;
                            }),
                            child: CompetitionWidget(
                                image: e.images,
                                name: e.name,
                                isSelected: e.name == _selectedCompetition),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),*/
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: matchCards.map(
                        (e) {
                          return InkWell(
                              onTap: () => setState(() {
                                    _selectedMatch = e.match;
                                    _slideupPanelUp = !_slideupPanelUp;
                                  }),
                              child: MatchCard(
                                  match: e.match,
                                  isSelected: e.match == _selectedMatch));
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  final Match match;
  const PanelWidget(
      {Key? key,
      required this.controller,
      required this.panelController,
      required this.match})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        const SizedBox(height: 12),
        dragHandleBuilder(),
        const SizedBox(height: 18),
        SlideUpMatchCard(
          match: match,
        ),
        const SizedBox(height: 34)
      ],
    );
  }

  Widget dragHandleBuilder() {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onTap: togglePanel,
    );
  }

  void togglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }
}
