// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frvb/constants.dart';
import 'package:frvb/model/article.dart';
import 'package:frvb/model/theme_provider.dart';
import 'package:frvb/pages/news_page.dart';
import 'package:frvb/pages/settings.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

class CreateArticle extends StatefulWidget {
  const CreateArticle({super.key});

  @override
  State<CreateArticle> createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String link = '';
  String author = '';
  DateTime articlePostDate = DateTime.now();
  DateTime articleOriginalDate = DateTime.now();
  bool? validArticle = false;
  bool disableComments = false;
  bool disableLikes = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.settings_solid,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
        title: const Text('Create an article'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter a link..',
                            labelText: 'Article link',
                          ),
                          onChanged: (value) {
                            setState(() {
                              link = value;
                            });
                          },
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Author name..',
                            labelText: 'Source author',
                          ),
                          onChanged: (value) {
                            setState(() {
                              author = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText:
                                'Enter the title... (copied from the source page)',
                            labelText: 'Article title',
                          ),
                          onChanged: (value) {
                            title = value;
                          },
                          maxLines: 5,
                        ),
                        _FormDatePicker(
                          label: 'Today\'s date',
                          date: articlePostDate,
                          onChanged: (value) {
                            setState(() {
                              articlePostDate = value;
                            });
                          },
                        ),
                        _FormDatePicker(
                          label: 'Article date (from the source)',
                          date: articleOriginalDate,
                          onChanged: (value) {
                            setState(() {
                              articleOriginalDate = value;
                            });
                          },
                        ),
                        SwitchListTile(
                          value: disableComments,
                          title: Text(
                            disableComments
                                ? "Enable Comments"
                                : "Disable comments",
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              disableComments = !disableComments;
                              /* final provider = Provider.of<ThemeProvider>(
                                  context,
                                  listen: false);
                              provider.toggleTheme(value);*/
                            });
                          },
                          secondary: Icon(
                            disableComments == true
                                ? Icons.comments_disabled
                                : Icons.comment,
                          ),
                        ),
                        SwitchListTile(
                          value: disableLikes,
                          title: Text(
                            disableLikes ? "Enable Likes" : "Disable Likes",
                          ),
                          onChanged: (bool value) {
                            setState(() {
                              disableLikes = !disableLikes;
                            });
                          },
                          secondary:
                              const Icon(Icons.thumb_up_off_alt_outlined),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: validArticle,
                              onChanged: (checked) {
                                setState(() {
                                  validArticle = checked;
                                });
                              },
                            ),
                            Text('I confirm that this article is valid',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          articles.insert(
                            0,
                            Article(
                              domain: link,
                              text: title,
                              by: author,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsPage()),
                          );
                        },
                        child: Text(
                          "Create article",
                          style: TextStyle(
                            color: themeProvider.isDarkMode
                                ? Colors.white70
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final String label;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.label,
    required this.date,
    required this.onChanged,
  });

  @override
  State<_FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
