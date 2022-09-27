// Copyright 2022, the Gabo project author.
// for details. Use of this source code is prohibited !

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: AutofillGroup(
              child: Column(
                children: [
                  ...[
                    TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Jane',
                        labelText: 'First Name',
                      ),
                      autofillHints: const [AutofillHints.givenName],
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Doe',
                        labelText: 'Last Name',
                      ),
                      autofillHints: const [AutofillHints.familyName],
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'info@gabo.io',
                        labelText: 'Email',
                      ),
                      autofillHints: [AutofillHints.email],
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '0788342345',
                        labelText: 'Telephone',
                      ),
                      autofillHints: [AutofillHints.telephoneNumber],
                    ),
                    /*const TextField(
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '123 4th Ave',
                        labelText: 'Street Address',
                      ),
                      autofillHints: [AutofillHints.streetAddressLine1],
                    ),
                    const TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '12345',
                        labelText: 'Postal Code',
                      ),
                      autofillHints: [AutofillHints.postalCode],
                    ),*/
                    const TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        hintText: 'Rwanda',
                        labelText: 'Country',
                      ),
                      autofillHints: [AutofillHints.countryName],
                    ),
                    /*const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '250',
                        labelText: 'Country Code',
                      ),
                      autofillHints: [AutofillHints.countryCode],
                    ),*/
                    TextButton(
                      onPressed: () {},
                      child: const Text("Create account"),
                    ),
                  ].expand(
                    (widget) => [
                      widget,
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
