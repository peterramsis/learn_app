import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/components/flash_card_page/result_box.dart';
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
  List<Word> incorrectCards = [];

  bool isFirstRound = true , isRoundCompleted = false , isSessionCompleted = false;


  updateCardOutCome({required Word word ,required bool isCorrect}){
    if(!isCorrect){
       incorrectCards.add(word);
    }
    incorrectCards.forEach((element) {print(element.english);});
    notifyListeners();
  }
  generateAllSelectedWords(){
    selectedWords.clear();
    isRoundCompleted = false;

    if(isFirstRound){
      selectedWords = words.where( (element) => element.topic == topic).toList();
    }else{
      selectedWords = incorrectCards.toList();
      incorrectCards.clear();
    }

  }

  reset(){

    isRoundCompleted = false;
    isFirstRound  =true;
    isSessionCompleted = false;
    notifyListeners();
  }

  generateCurrentWords(BuildContext context){
   if(selectedWords.isNotEmpty){
     final numbers =  Random().nextInt(selectedWords.length);
     word = selectedWords[numbers];
     selectedWords.removeAt(numbers);
   }else{

     if(incorrectCards.isEmpty){
       isSessionCompleted = true;
     }
     isRoundCompleted = true;
     isFirstRound = false;

     Future.delayed(Duration(microseconds: 500), () => showDialog(
       context: context,
       builder: (context) => const ResultBox(),
     ));
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

     updateCardOutCome(word: wordTwo, isCorrect: direction == SlideDirection.leftAway);

     print(direction);
     notifyListeners();
  }
}