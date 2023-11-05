import 'package:flutter/material.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/flash_card_page.dart';
import 'package:provider/provider.dart';
class ResultBox extends StatelessWidget {
  const ResultBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<FlashcardsNotifier>(builder: (_,notifier,__)=>AlertDialog(
      title: const Text("Round Completed"),
      actions: [
        ElevatedButton(onPressed: (){
          notifier.reset();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const FlashcardsPage()));
        }, child: const Text("restart incorrect"))
      ],
    ));
  }
}
