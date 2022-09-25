import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/pages/about_page.dart';
import 'package:frvb/pages/account_page.dart';
import 'package:frvb/pages/events_page.dart';
import 'package:frvb/pages/main_page.dart';
import 'package:frvb/widgets/change_theme_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    //var textScale = MediaQuery.of(context).textScaleFactor;
    final themeProvider = Provider.of<ThemeProvider>(context);

    ///theme: darkMode ? ThemeData.dark() : ThemeData.light(),
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headline4,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              // builder: (context) => const MatchesPage()));
              builder: (context) => const MainPage(),
            ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        //padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: TextField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    color: themeProvider.isDarkMode
                        ? AppVars.darkThemeTextColor
                        : AppVars.iconColor,
                    CupertinoIcons.clear,
                  ),
                ),
                prefixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    CupertinoIcons.search,
                    color: themeProvider.isDarkMode
                        ? AppVars.darkThemeTextColor
                        : AppVars.iconColor,
                  ),
                  onPressed: () {},
                ),
                hintText: 'Search',
              )),
            ),
            const SizedBox(
              height: 16,
            ),

            /// Main body of the page
            Column(
              children: [
                /// Text Separator of general settings "General"
                Align(
                  alignment: Alignment.centerLeft,
                  child: separatorText("General"),
                ),
                const SizedBox(height: 6),

                ///General settings container
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          settingListTileElement(
                              label: "Account",
                              icon: Icons.account_box_outlined,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                              }),
                          settingElementsDivider(),
                          settingListTileElement(
                              label: "Notifications",
                              icon: Icons.notifications,
                              onTap: () {}),
                          settingElementsDivider(),
                          SwitchListTile(
                            value: themeProvider.isDarkMode,
                            title: Text(
                              themeProvider.isDarkMode
                                  ? "Swith to light mode"
                                  : "Switch to dark mode",
                            ),
                            onChanged: (bool value) {
                              setState(() {
                                final provider = Provider.of<ThemeProvider>(
                                    context,
                                    listen: false);
                                provider.toggleTheme(value);
                              });
                            },
                            secondary: Icon(
                              themeProvider.isDarkMode
                                  ? Icons.light_mode_rounded
                                  : Icons.dark_mode_rounded,
                            ),
                          ),
                          settingElementsDivider(),
                          settingListTileElement(
                              label: "Privacy & security",
                              icon: Icons.lock,
                              onTap: () {}),
                          settingElementsDivider(),
                          settingListTileElement(
                              label: "About",
                              icon: Icons.question_mark_outlined,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const About()));
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),

                /// Text Separator

                /// Push notification settings
                Align(
                  alignment: Alignment.centerLeft,
                  child: separatorText("Notifications"),
                ),
                const SizedBox(height: 12),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SwitchListTile(
                            title: const Text('Live games'),
                            value: AppVars.showLiveMatchWidget,
                            onChanged: (bool value) {
                              setState(() {
                                AppVars.showLiveMatchWidget = value;
                              });
                            },
                            secondary: const Icon(Icons.live_tv),
                          ),
                          settingElementsDivider(),
                          SwitchListTile(
                            title: const Text('Game Updates'),
                            value: AppVars.gamesUpdateNotificationsEnabled,
                            onChanged: (bool value) {
                              setState(() {
                                AppVars.gamesUpdateNotificationsEnabled = value;
                              });
                            },
                            secondary: const Icon(Icons.sports_volleyball),
                          ),
                          settingElementsDivider(),
                          SwitchListTile(
                            title: const Text('Favorite Competitions update'),
                            value: AppVars
                                .favoriteCompetitionUpdateNotificationsEnabled,
                            onChanged: (bool value) {
                              setState(() {
                                AppVars.favoriteCompetitionUpdateNotificationsEnabled =
                                    value;
                              });
                            },
                            secondary: const Icon(Icons.bookmark),
                          ),
                          settingElementsDivider(),
                          SwitchListTile(
                            title: const Text('Favorite athletes update'),
                            value: AppVars
                                .favoriteAthleteUpdateNotificationsEnabled,
                            onChanged: (bool value) {
                              setState(() {
                                AppVars.favoriteAthleteUpdateNotificationsEnabled =
                                    value;
                              });
                            },
                            secondary: const Icon(Icons.lightbulb_outline),
                          ),
                          settingElementsDivider(),
                          SwitchListTile(
                            title: const Text('Favorite teams update'),
                            value:
                                AppVars.favoriteTeamUpdateNotificationsEnabled,
                            onChanged: (bool value) {
                              setState(() {
                                AppVars.favoriteTeamUpdateNotificationsEnabled =
                                    value;
                              });
                            },
                            secondary: const Icon(Icons.lightbulb_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: separatorText("Widgets and Cards"),
                ),
                const SizedBox(height: 12),

                /// Widgets and cards settings
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SwitchListTile(
                            title: const Text('Live games'),
                            subtitle: const Text(
                                "Live game widget is displayed on homepage"),
                            value: AppVars.showLiveMatchWidget,
                            onChanged: (bool value) {
                              setState(() {
                                AppVars.showLiveMatchWidget = value;
                              });
                            },
                            secondary: const Icon(Icons.live_tv),
                          ),
                          SwitchListTile(
                            title: const Text('Developper mode'),
                            subtitle: const Text(
                                "This is only useful for Gabo.co employees and partners"),
                            value: AppVars.developperMode,
                            onChanged: (bool value) {
                              bool authentificationSucceded = false;
                              if (value == true) {
                                /*Future.delayed(
                                    Duration.zero,
                                        () => showComfirmationDevelopperModeDialog(
                                        context));*/
                                if (showComfirmationDevelopperModeDialog ==
                                    true) {
                                } else {
                                  value = false;
                                  AppVars.developperMode = false;
                                }
                              }

                              //showDialog(context: context, builder: []);
                              /*AlertDialog(
                                title: Text('Reset settings?'),
                                content: Text('This will reset your device to its default factory settings.'),
                                actions: [
                                  FlatButton(
                                    textColor: Color(0xFF6200EE),
                                    onPressed: () {},
                                    child: Text('CANCEL'),
                                  ),
                                  FlatButton(
                                    textColor: Color(0xFF6200EE),
                                    onPressed: () {},
                                    child: Text('ACCEPT'),
                                  ),
                                ],
                              )*/

                              setState(() {
                                AppVars.developperMode = value;
                              });
                            },
                            secondary: const Icon(Icons.code),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text separatorText(String string) {
    return Text(
      string,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
    );
  }

  Widget settingElementsDivider() {
    return Container(
        margin: const EdgeInsets.only(left: 48),
        child: const Expanded(child: Divider(thickness: 1.0)));
  }

  bool showComfirmationDevelopperModeDialog(BuildContext context) {
    bool returnResult = false;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Dev mode'),
              content: const Text(
                  'Are you working or partnering with Gabo.io, if so, authenticate yourself'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('CANCEL'),
                ),
                TextButton(
                  onPressed: () {
                    returnResult =
                        true; //this should be replaced by Authentication function that will test a paddsord and ID, together with functions
                  },
                  child: const Text('Authenticate myself'),
                ),
              ],
            ));
    return returnResult;
  }
}

class settingListTileElement extends StatelessWidget {
  final String label;
  final IconData icon;
  final GestureTapCallback onTap;
  const settingListTileElement(
      {required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      leading: Icon(icon),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
      onTap: onTap,
    );
  }
}
