import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn/components/flash_card_page/tts_button.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({Key? key  , required this.isCardOne}) : super(key: key);

 final bool isCardOne;

  @override
  Widget build(BuildContext context) {
    return isCardOne ? Consumer<FlashcardsNotifier>(builder: (_,notifier,__){
      return Column(
        children: [
          buildImageBox(notifier.word.english),

          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                child: Text(notifier.word.character),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                child: Text(notifier.word.pinyin),
              ),
            ),
          ),
        ],
      );
    }) : Consumer<FlashcardsNotifier>(builder: (_,notifier,__){
      return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  child: Text(notifier.word.english),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  child: Text(notifier.word.character),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  child: Text(notifier.word.pinyin),
                ),
              ),

            ),
            TtsButton(
              iconSize: 70,
              text: notifier.wordTwo.pinyin,
            )
          ],
        ),
      );
    });
  }

  Expanded buildTextBox(String text) {
    return Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              child: Text(text),
            ),
          ),
        );
  }

  Expanded buildImageBox(String image) => Expanded( flex: 4,child: Image.asset("assets/images/$image.png"));
}
