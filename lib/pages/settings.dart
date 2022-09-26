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
                          settingElementsDivider(),
                          ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DevModeAlert(
                                      "Are you working or partnering with Gabo.io, if so, authenticate yourself!",
                                    );
                                  });
                            },
                            subtitle: const Text(
                              "This is only useful for Gabo.co employees and partners",
                            ),
                            title: const Text("Developper mode"),
                            leading: const Icon(
                              Icons.developer_mode,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(AppVars.developperMode ? 'ON' : 'OFF'),
                                const Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
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
}

class DevModeAlert extends StatefulWidget {
  final title;
  const DevModeAlert(this.title);

  @override
  State<DevModeAlert> createState() => _DevModeAlertState();
}

class _DevModeAlertState extends State<DevModeAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Icon(
                Icons.code,
                size: 70,
              ),
            ),
            Container(
              color: AppVars.selectedColor,
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              AppVars.developperMode != AppVars.developperMode;
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text("Authenticate"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class settingListTileElement extends StatelessWidget {
  final String label;
  final IconData icon;
  final GestureTapCallback onTap;
  String subtitle;
  settingListTileElement(
      {required this.label,
      required this.icon,
      required this.onTap,
      this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(subtitle),
      title: Text(label),
      leading: Icon(icon),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
      onTap: onTap,
    );
  }
}
