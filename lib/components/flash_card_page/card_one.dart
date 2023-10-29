import 'package:flutter/material.dart';
import 'package:learn/animations/half_filp_animation.dart';
import 'package:learn/animations/slide_animation.dart';
import 'package:learn/enum/slide_direction.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:provider/provider.dart';

class CardOne extends StatefulWidget {
  const CardOne({Key? key}) : super(key: key);

  @override
  State<CardOne> createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(builder: (_,notifier,__){
      final size = MediaQuery.of(context).size;
      return HalfFlipAnimation(
        animate: notifier.flipCard1,
        animationCompleted: (){
          notifier.runFlipCardTwo();
        },
        reset: false,
        flipFromHalfWay: false,
        child: SlideAnimation(
          direction: SlideDirection.upIn,
          child: Center(
            child: Container(
              width: size.width * .90,
              height: size.height * .70,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
              ),
            ),
          ),
        ),
      );
    });
  }
}
