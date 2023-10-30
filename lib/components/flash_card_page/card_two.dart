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
      return GestureDetector(
        onHorizontalDragEnd: (details){
          print("----$details");
          if(details.primaryVelocity! > 100){
              notifier.runSwipeCardTwo(direction: SlideDirection.leftAway);
              notifier.runSlideCardOne();
              notifier.setTouches(ignore: true);
          }

          if(details.primaryVelocity! < -100){
            notifier.runSwipeCardTwo(direction: SlideDirection.rightAway);
            notifier.runSlideCardOne();
            notifier.setTouches(ignore: true);
          }


        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          animationCompleted: (){
            notifier.setTouches(ignore: false);
          },

          flipFromHalfWay: true,
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCard2();
            },
            direction: notifier.swipeDirection,
            reset: notifier.resetSwipeCardTwo,
            animate: notifier.swipeCardTwo,
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
        ),
      );
    });
  }
}
