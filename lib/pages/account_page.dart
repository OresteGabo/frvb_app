import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool showPassword = false;
  List<bool> _selections = List.generate(3, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              /*const Text(
                "Edi Profile",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),*/
              /*const SizedBox(
                height: 5,
              ),*/
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        /*border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),*/

                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/clubs/kvc.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              buildTextField("Your name", "MUHIRWA GABO Oreste", false),
              buildTextField("Password", "", true),
              buildTextField("email", "info@gabo.io", false),
              buildTextField("Country of residence", "Rwanda", false),
              ToggleButtons(
                children: [
                  Text("Male"),
                  Text("Female"),
                  Text("No answer"),
                ],
                isSelected: _selections,
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                  });
                },
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String hintText, bool isPasswordField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: TextField(
        obscureText: !showPassword,
        decoration: InputDecoration(
          suffixIcon: isPasswordField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
