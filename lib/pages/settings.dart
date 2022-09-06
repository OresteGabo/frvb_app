import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
/*
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                AppVars.lightmodeShadow,
                /*BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.shade400,
                ),*/
              ],
              //border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(24),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: '    Search',
              ),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "     General",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: AppVars.isDark
                          ? Colors.black45
                          : Colors.grey.shade400,
                    ),
                  ],
                  //color: Colors.white,
                  //border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        settingElement("Account", Icons.account_box),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement(
                            "Notifications", Icons.notification_important),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("Dark mode", Icons.dark_mode_rounded,
                            isSwitchButton: true),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("Privacy & security", Icons.lock),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("About", Icons.question_mark_outlined),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "     Notifications",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      color: AppVars.isDark
                          ? Colors.black45
                          : Colors.grey.shade400,
                    ),
                  ],
                  //color: Colors.white,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        settingElement("Live games", Icons.live_tv,
                            isSwitchButton: true),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement(
                            //like when a game is cancelled, or rescheduled
                            "games update",
                            Icons.sports_volleyball,
                            isSwitchButton: true),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement(
                            "Favorite Athlete update", Icons.bookmark,
                            isSwitchButton: true),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("Favorite competitions update",
                            Icons.favorite_border_outlined,
                            isSwitchButton: true),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("Favorite teams update",
                            Icons.question_mark_outlined,
                            isSwitchButton: true),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget settingsElementWithSwitch(
      IconData icon, String label, Switch switchVal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ]),
        Row(
          children: [
            switchVal,
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ],
    );
  }

  Widget settingElementsDivider() {
    return Container(
        margin: const EdgeInsets.only(left: 48),
        child: const Expanded(child: Divider(thickness: 1.0)));
  }

  Widget settingElement(
    String label,
    IconData icon, {
    IconData actionButton = Icons.arrow_forward_ios_rounded,
    bool isSelected = false,
    bool isPremium = false,
    bool isSwitchButton = false,
  }) {
    List<bool> _values = [true, false, true, false, false];
    const int count = 4;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 12),
          Text(label,
              style: TextStyle(
                color: Colors.grey.shade600,
              )),
        ]),
        Row(
          children: [
            isSwitchButton
                ? Switch(
                    value: AppVars.isDark,
                    onChanged: (bool value) {
                      AppVars.isDark = !AppVars.isDark;
                    },
                  )
                : Icon(
                    actionButton,
                    color: Colors.grey.shade600,
                  ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ],
    );
  }
}

Widget darkSettingElement(String label) {
  bool isDark = false;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(children: [
        const SizedBox(width: 12),
        Icon(
          Icons.dark_mode_rounded,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 12),
        Text(label,
            style: TextStyle(
              color: Colors.grey.shade600,
            )),
      ]),
      Row(
        children: [
          Switch(value: AppVars.isDark, onChanged: (value) {}),
          Switch(
              activeColor: Colors.greenAccent,
              value: AppVars.isDark,
              onChanged: (value) {}),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    ],
  );
}
*/

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // static bool isDark = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool darkMode = AppVars.isDark;
    //return MaterialApp(
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
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          ///
          Container(
            height: 40,
            decoration: BoxDecoration(
              //color: AppVars.isDark ? Colors.grey : Colors.white,
              boxShadow: [
                AppVars.boxShadow,
              ],
              //border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(24),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: '    Search',
              ),
            ),
          ),
          const SizedBox(height: 12),

          /// Main body of the page
          Column(
            children: [
              /// Text Separator of general settings "General"
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "     General",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              ///General settings container
              Container(
                width: width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    AppVars.boxShadow,
                  ],
                  //color: Colors.white,
                  //border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        settingElement("Account", Icons.account_box),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement(
                            "Notifications", Icons.notification_important),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                          Icons.dark_mode_rounded,
                          "Dark & light mode",
                          CupertinoSwitch(
                              activeColor: Colors.greenAccent,
                              value: AppVars.isDark,
                              onChanged: (value) {
                                setState(() {
                                  AppVars.isDark = !AppVars.isDark;
                                });
                              }),
                        ),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("Privacy & security", Icons.lock),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("About", Icons.question_mark_outlined),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              /// Text Separator
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "     Notifications",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              /// Push notification settings
              Container(
                width: width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    AppVars.boxShadow,
                  ],
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        settingsElementWithSwitch(
                          Icons.live_tv,
                          "Live games",
                          CupertinoSwitch(
                              activeColor: Colors.greenAccent,
                              value: AppVars.liveGamesNotificationsEnabled,
                              onChanged: (value) {
                                setState(() {
                                  AppVars.liveGamesNotificationsEnabled =
                                      !AppVars.liveGamesNotificationsEnabled;
                                });
                              }),
                        ),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                          Icons.sports_volleyball,
                          "Games update",
                          CupertinoSwitch(
                              activeColor: Colors.greenAccent,
                              value: AppVars.gamesUpdateNotificationsEnaled,
                              onChanged: (value) {
                                setState(() {
                                  AppVars.gamesUpdateNotificationsEnaled =
                                      !AppVars.gamesUpdateNotificationsEnaled;
                                });
                              }),
                        ),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.bookmark,
                            "Favorite Athlete update",
                            CupertinoSwitch(
                                activeColor: Colors.greenAccent,
                                value: AppVars
                                    .favoriteAthleteUpdateNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.favoriteAthleteUpdateNotificationsEnabled =
                                        !AppVars
                                            .favoriteAthleteUpdateNotificationsEnabled;
                                  });
                                })),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.bookmark,
                            "Favorite Competitions update",
                            CupertinoSwitch(
                                activeColor: Colors.greenAccent,
                                value: AppVars
                                    .favoriteCompetitionUpdateNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.favoriteCompetitionUpdateNotificationsEnabled =
                                        !AppVars
                                            .favoriteCompetitionUpdateNotificationsEnabled;
                                  });
                                })),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.bookmark,
                            "Favorite teams update",
                            CupertinoSwitch(
                                //activeColor: Colors.greenAccent,
                                value: AppVars
                                    .favoriteTeamUpdateNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.favoriteTeamUpdateNotificationsEnabled =
                                        !AppVars
                                            .favoriteTeamUpdateNotificationsEnabled;
                                  });
                                })),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget settingsElementWithSwitch(
      IconData icon, String label, CupertinoSwitch switchVal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            color: AppVars.isDark
                ? AppVars.darkThemeTextColor
                : AppVars.lightThemeTextColor,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: AppVars.isDark
                  ? AppVars.darkThemeTextColor
                  : AppVars.lightThemeTextColor,
            ),
          ),
        ]),
        Row(
          children: [
            switchVal,
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ],
    );
  }

  Widget settingElement(String label, IconData icon,
      {IconData actionButton = Icons.arrow_forward_ios_rounded,
      bool isSelected = false,
      bool isPremium = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            color: AppVars.isDark
                ? AppVars.darkThemeTextColor
                : AppVars.lightThemeTextColor,
          ),
          const SizedBox(width: 12),
          Text(label,
              style: TextStyle(
                color: AppVars.isDark
                    ? AppVars.darkThemeTextColor
                    : AppVars.lightThemeTextColor,
              )),
        ]),
        Row(
          children: [
            Icon(
              actionButton,
              color: Colors.grey.shade600,
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ],
    );
  }

  Widget settingElementsDivider() {
    return Container(
        margin: const EdgeInsets.only(left: 48),
        child: const Expanded(child: Divider(thickness: 1.0)));
  }
}
