import 'package:flutter/material.dart';
import 'package:learn/components/app/CustomAppBar.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/home_page.dart';
import 'package:provider/provider.dart';
class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(builder: (_, notifier, __){
      return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: CustomAppBar(),
        ),
      );
    });
  }


}

