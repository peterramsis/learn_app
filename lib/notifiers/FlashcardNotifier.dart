import 'package:flutter/cupertino.dart';
import 'package:learn/enum/slide_direction.dart';

class FlashcardsNotifier extends ChangeNotifier{
  String topic = "";
  bool flipCard1 = false;
  bool flipCard2 = false;
  bool slideCareOne = false;
  SlideDirection swipeDirection = SlideDirection.none;
  bool swipeCardTwo = false;

  bool resetSlideCardOne = false,
      resetFlipCard1 = false,
      resetFlipCard2 = false,
      resetSwipeCardTwo = false;

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  resetCard1() {
    resetSlideCardOne = true;
    resetFlipCard1 = true;
    slideCareOne = false;
    flipCard1 = false;
  }


  runFlipCardOne(){
    flipCard1 = true;
    resetFlipCard1 = false;
    notifyListeners();
  }
  resetCard2() {
    resetFlipCard2 = true;
    resetSwipeCardTwo = true;
    flipCard2 = false;
    swipeCardTwo = false;
  }

  runFlipCardTwo(){
    flipCard2 = true;
    resetFlipCard2 = false;
    notifyListeners();
  }

  runSlideCardOne(){
    slideCareOne = true;
    resetSlideCardOne = false;
    notifyListeners();
  }
  runSwipeCardTwo({required SlideDirection direction}){
     swipeDirection = direction;
     swipeCardTwo = true;
     resetFlipCard2 = false;

     print(direction);
     notifyListeners();
  }
}