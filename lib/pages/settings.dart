import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frvb/main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.shade400,
                ),
              ],
              //border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(24),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '    Search',
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  color: Colors.grey.shade400,
                ),
              ],
              color: Colors.white,
              //border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                settingElement("Account", Icons.account_box),
                const SizedBox(height: 6),
                settingElementsDivider(),
                const SizedBox(height: 6),
                settingElement("Notifications", Icons.notification_important),
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
          ),
        ],
      ),
    );
  }
}

Widget settingElementsDivider() {
  return Container(
      margin: const EdgeInsets.only(left: 60),
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
        const SizedBox(width: 24),
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
              ? const SwitchButton()
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

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _value = false;
  //currentTheme=ThemeData.light();
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _value,
      activeColor: Colors.orangeAccent,
      onChanged: (bool value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}
