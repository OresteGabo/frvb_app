import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:flutter/material.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return CupertinoSwitch(
      value: themeProvider.isDarkMode,
      onChanged: (bool value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
