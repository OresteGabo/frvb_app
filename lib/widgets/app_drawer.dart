import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Contacts',
            onTap: () {},
          ),
          /*const Image(
            image: AssetImage("assets/frvblogo.jpg"),
          ),*/
          _createDrawerItem(
            icon: Icons.event,
            text: 'Events',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.note,
            text: 'Notes',
            onTap: () {},
          ),
          const Divider(),
          _createDrawerItem(
              icon: Icons.collections_bookmark, text: 'Steps', onTap: () {}),
          _createDrawerItem(icon: Icons.face, text: 'Authors', onTap: () {}),
          _createDrawerItem(
              icon: Icons.account_box,
              text: 'Flutter Documentation',
              onTap: () {}),
          _createDrawerItem(
              icon: Icons.stars, text: 'Useful Links', onTap: () {}),
          const Divider(),
          _createDrawerItem(
              icon: Icons.bug_report, text: 'Report an issue', onTap: () {}),
          ListTile(
            title: const Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    /*return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          image: DecorationImage(
            //fit: BoxFit.fill,
            image: AssetImage("assets/frvblogo.png"),
          ),
        ),
        child: Stack(children: const <Widget>[
          /*Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Step-by-Step",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),*/
        ]));*/
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.orangeAccent,
        image: DecorationImage(
          //fit: BoxFit.fill,
          image: AssetImage("assets/frvblogo.png"),
        ),
      ),
      child: Stack(
        children: const <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              //child: AssetImage("assets/frvblogo.png"),
              //backgroundColor: Colors.orangeAccent,
              backgroundImage: AssetImage("assets/frvblogo.jpg"),
              radius: 50,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text("FRVB Mobile news app"),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

class Routes {
  //static const String contacts = ContactsPage.routeName;
  static const String events = EventsPage.routeName;
  static const String notes = NotesPage.routeName;
}

class EventsPage extends StatelessWidget {
  static const String routeName = '/events';

  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
        ),
        drawer: AppDrawer(),
        body: const Center(child: Text("Events")));
  }
}

class NotesPage extends StatelessWidget {
  static const String routeName = '/notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Notes")));
  }
}
