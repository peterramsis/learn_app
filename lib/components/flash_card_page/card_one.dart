import 'package:flutter/material.dart';
import 'package:learn/animations/half_filp_animation.dart';
import 'package:learn/animations/slide_animation.dart';
import 'package:learn/components/flash_card_page/CardDisplay.dart';
import 'package:learn/config/contstants.dart';
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
      return GestureDetector(
        onDoubleTap: (){
          notifier.runFlipCardOne();
          notifier.setTouches(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          animationCompleted: (){
            notifier.resetCard1();
            notifier.runFlipCardTwo();
          },
          flipFromHalfWay: false,
          child: SlideAnimation(
            animationDuration: 600,
            animationDaly: 600,
            animate: notifier.slideCareOne && !notifier.isRoundCompleted,
            direction: SlideDirection.upIn,
            reset: notifier.resetSlideCardOne,
            animationCompleted: (){
              notifier.setTouches(ignore: false);
            },
            child: Center(
              child: Container(
                width: size.width * .90,
                height: size.height * .70,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(kCircularBorderRadius),
                    border: Border.all(
                        color: Colors.white,
                        width: kCardBorderRadius
                    )
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CardDisplay( isCardOne: true),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
