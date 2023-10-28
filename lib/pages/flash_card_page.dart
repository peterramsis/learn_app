import 'package:flutter/material.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: notifier.topic,
            child: Text(notifier.topic),
          ),
          leading: Image.asset("assets/images/${notifier.topic}.png"),
          actions: [
            IconButton(onPressed: ()=>Navigator.of(context).pushAndRemoveUntil(  MaterialPageRoute(builder: (context)=> const HomePage()) , (route) => false), icon: const Icon(Icons.close))
          ],
        ),
      );
    });
  }
}

