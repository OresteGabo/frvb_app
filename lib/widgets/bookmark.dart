import 'package:flutter/material.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GameBookMark extends BookMark {}

class CompetitionBookMark extends BookMark {}
