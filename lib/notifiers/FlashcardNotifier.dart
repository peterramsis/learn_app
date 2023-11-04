import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:learn/config/contstants.dart';
import 'package:learn/data/words.dart';
import 'package:learn/enum/slide_direction.dart';
import 'package:learn/models/word.dart';

class FlashcardsNotifier extends ChangeNotifier{
  String topic = "";

  Word word = Word(topic: "", english: "Loading", character: "", pinyin: "");
  Word wordTwo = Word(topic: "", english: "Loading", character: "", pinyin: "");
  bool flipCard1 = false;
  bool flipCard2 = false;
  bool slideCareOne = false;
  SlideDirection swipeDirection = SlideDirection.none;
  bool swipeCardTwo = false;
  bool ignoreTouches = true;

  bool resetSlideCardOne = false,
      resetFlipCard1 = false,
      resetFlipCard2 = false,
      resetSwipeCardTwo = false;

  List<Word> selectedWords= [];


  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where( (element) => element.topic == topic).toList();

  }

  generateCurrentWords(){
   if(selectedWords.isNotEmpty){
     final numbers =  Random().nextInt(selectedWords.length);
     word = selectedWords[numbers];
     selectedWords.removeAt(numbers);
   }else{
     print("all selected word empty");
   }
   
   Future.delayed(const Duration(microseconds: kSlideAwayDuration) , (){
       wordTwo = word;
   });
  }

  //animation card

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  setTouches({required bool ignore}){
    ignoreTouches = ignore;
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