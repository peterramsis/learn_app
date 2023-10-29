import 'package:flutter/cupertino.dart';

class FlashcardsNotifier extends ChangeNotifier{
  String topic = "";
  bool flipCard1 = false;
  bool flipCard2 = false;

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  runFlipCardOne(){
    flipCard1 = true;
    notifyListeners();
  }
  runFlipCardTwo(){
    flipCard2 = true;
    notifyListeners();
  }
}