
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/home_page.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<FlashcardsNotifier>(builder: (_,notifier,__){
      return AppBar(
        title: Hero(
          tag: notifier.topic,
          child: Text(notifier.topic),
        ),
        leading: Image.asset("assets/images/${notifier.topic}.png"),
        actions: [
          IconButton(onPressed: ()=>Navigator.of(context).pushAndRemoveUntil(  MaterialPageRoute(builder: (context)=> const HomePage()) , (route) => false), icon: const Icon(Icons.close))
        ],
      );
  });
  }
}
