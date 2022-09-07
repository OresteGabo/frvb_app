import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
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
    var width = MediaQuery.of(context).size.width;
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
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
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
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    themeProvider.isDarkMode
                        ? AppVars.darkmodeShadow
                        : AppVars.lightmodeShadow,
                  ],
                  //color: Colors.white,
                  //border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        settingElement(
                            "Account", Icons.account_box, themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement(
                          "Notifications",
                          CupertinoIcons.bell_solid,
                          themeProvider,
                        ),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            themeProvider.isDarkMode
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            themeProvider.isDarkMode
                                ? "Swith to light mode"
                                : "Switch to dark mode",
                            const ChangeThemeButtonWidget(),
                            themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement(
                            "Privacy & security", Icons.lock, themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingElement("About", Icons.question_mark_outlined,
                            themeProvider),
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
                    themeProvider.isDarkMode
                        ? AppVars.darkmodeShadow
                        : AppVars.lightmodeShadow,
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
                                trackColor: AppVars.iconColor,
                                activeColor: AppVars.selectedColor,
                                value: AppVars.liveGamesNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.liveGamesNotificationsEnabled =
                                        !AppVars.liveGamesNotificationsEnabled;
                                  });
                                }),
                            themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.sports_volleyball,
                            "Games update",
                            CupertinoSwitch(
                                trackColor: AppVars.iconColor,
                                activeColor: AppVars.selectedColor,
                                value: AppVars.gamesUpdateNotificationsEnaled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.gamesUpdateNotificationsEnaled =
                                        !AppVars.gamesUpdateNotificationsEnaled;
                                  });
                                }),
                            themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.bookmark,
                            "Favorite Athlete update",
                            CupertinoSwitch(
                                trackColor: AppVars.iconColor,
                                activeColor: AppVars.selectedColor,
                                value: AppVars
                                    .favoriteAthleteUpdateNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.favoriteAthleteUpdateNotificationsEnabled =
                                        !AppVars
                                            .favoriteAthleteUpdateNotificationsEnabled;
                                  });
                                }),
                            themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.bookmark,
                            "Favorite Competitions update",
                            CupertinoSwitch(
                                trackColor: AppVars.iconColor,
                                activeColor: AppVars.selectedColor,
                                value: AppVars
                                    .favoriteCompetitionUpdateNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.favoriteCompetitionUpdateNotificationsEnabled =
                                        !AppVars
                                            .favoriteCompetitionUpdateNotificationsEnabled;
                                  });
                                }),
                            themeProvider),
                        const SizedBox(height: 6),
                        settingElementsDivider(),
                        const SizedBox(height: 6),
                        settingsElementWithSwitch(
                            Icons.bookmark,
                            "Favorite teams update",
                            CupertinoSwitch(
                                trackColor: AppVars.iconColor,
                                activeColor: AppVars.selectedColor,
                                value: AppVars
                                    .favoriteTeamUpdateNotificationsEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    AppVars.favoriteTeamUpdateNotificationsEnabled =
                                        !AppVars
                                            .favoriteTeamUpdateNotificationsEnabled;
                                  });
                                }),
                            themeProvider),
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

  Widget settingsElementWithSwitch(IconData icon, String label,
      Widget switchVal, ThemeProvider themeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            //themeProvider.isDarkMode ? AppVars.darkmodeShadow:AppVars.lightmodeShadow,
            color: themeProvider.isDarkMode
                ? AppVars.darkThemeTextColor
                : AppVars.iconColor,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: themeProvider.isDarkMode
                  ? AppVars.darkThemeTextColor
                  : AppVars.iconColor,
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

  Widget settingElement(
      String label, IconData icon, ThemeProvider themeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const SizedBox(width: 12),
          Icon(
            icon,
            color: themeProvider.isDarkMode
                ? AppVars.darkThemeTextColor
                : AppVars.iconColor,
          ),
          const SizedBox(width: 12),
          Text(label,
              style: TextStyle(
                color: themeProvider.isDarkMode
                    ? AppVars.darkThemeTextColor
                    : AppVars.lightThemeTextColor,
              )),
        ]),
        Row(
          children: [
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: themeProvider.isDarkMode
                  ? AppVars.darkThemeTextColor
                  : AppVars.iconColor,
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
