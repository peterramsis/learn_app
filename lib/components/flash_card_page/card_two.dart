import 'package:flutter/material.dart';
import 'package:learn/animations/half_filp_animation.dart';
import 'package:learn/animations/slide_animation.dart';
import 'package:learn/enum/slide_direction.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:provider/provider.dart';

class CardTwo extends StatefulWidget {
  const CardTwo({Key? key}) : super(key: key);

  @override
  State<CardTwo> createState() => _CardTwoState();
}

class _CardTwoState extends State<CardTwo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(builder: (_,notifier,__){
      final size = MediaQuery.of(context).size;
      return HalfFlipAnimation(
        animate: notifier.flipCard2,
        animationCompleted: (){

        },
        reset: false,
        flipFromHalfWay: true,
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
