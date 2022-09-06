import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:frvb/constants.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return CupertinoSwitch(
      activeColor: AppVars.selectedColor,
      trackColor: AppVars.iconColor,
      value: themeProvider.isDarkMode,
      onChanged: (bool value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
