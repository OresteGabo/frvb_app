/*Trying to design an appdrawer that will fit the general public, with indicators of the user being a verified coach, federation admin,or a div 1 athlete, a journalism
 that add contents, .... and all other profiles that can be needed"
[main 356763a] Trying to design an appdrawer that will fit the general public, with indicators of the user being a verified coach, federation admin,or a div 1 athlete, a journalism that add contents, .... and all other profiles that can be needed
*/

import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.home_filled,
            text: 'Home',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Events',
            onTap: () {},
          ),
          const Divider(),
          _createDrawerItem(
              icon: Icons.schedule, text: 'Schedules', onTap: () {}),
          _createDrawerItem(
              icon: Icons.local_grocery_store_sharp,
              text: 'Store',
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
    return DrawerHeader(
      decoration: BoxDecoration(
        color: AppVars.palette.bgColorIsLight
            ? AppVars.palette.alternativeBgColor
            : AppVars.palette.backgroundColorLightMode,
      ),
      child: Stack(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/frvblogo.jpg"),
              //NetworkImage(
              //'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
              radius: 50.0,
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Muhire Jabo Honoré',
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          ),
          Align(
            alignment: Alignment.centerRight + const Alignment(0, .3),
            child: const Text(
              'Athlete',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight + const Alignment(0, .8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 3.0, left: 8),
                child: Wrap(
                  children: const [
                    Text(
                      'Verified',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
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
