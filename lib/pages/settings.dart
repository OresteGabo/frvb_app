import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(24),
            child: const TextField(),
          ),
          const SizedBox(height: 12),
          settingElement("Account", Icons.account_box),
          const SizedBox(height: 6),
          const Expanded(child: Divider(thickness: 1.0)),
          const SizedBox(height: 6),
          settingElement("Notifications", Icons.notification_add),
          const SizedBox(height: 6),
          const Expanded(child: Divider(thickness: 1.0)),
          const SizedBox(height: 6),
          settingElement("Appearance", Icons.panorama_fish_eye),
          const SizedBox(height: 6),
          const Expanded(child: Divider(thickness: 1.0)),
          const SizedBox(height: 6),
          settingElement("Privacy & security", Icons.lock),
          const SizedBox(height: 6),
          const Expanded(child: Divider(thickness: 1.0)),
          const SizedBox(height: 6),
          settingElement("About", Icons.question_mark_outlined),
          const SizedBox(height: 6),
          const Expanded(child: Divider(thickness: 1.0)),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}

Widget settingElement(String label, IconData icon,
    {bool isSelected = false, bool isPremium = false}) {
  return Row(children: [
    const SizedBox(width: 24),
    Icon(icon),
    const SizedBox(width: 12),
    Text(label),
  ]);
}
