
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsButton extends StatefulWidget {
  TtsButton({Key? key , required this.iconSize , required this.text}) : super(key: key);
   double iconSize;
   String text;

  @override
  State<TtsButton> createState() => _TtsButtonState();
}

class _TtsButtonState extends State<TtsButton> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {

    });
    _setUpTts();
    print("lll");
    super.initState();
  }
  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }
  bool _isTapped = false;
  final FlutterTts _tts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Expanded(child: IconButton(
      icon: Icon( Icons.audiotrack, size: widget.iconSize , color: _isTapped ? Colors.yellow : Colors.white),
      onPressed: () {




        _isTapped = true;
            setState(() {

            });
          Future.delayed(const Duration(microseconds: 500) , (){
            _isTapped = false;
            setState(() {

            });
          });


        _runTts(text: widget.text);
      },
    ));
  }

  _setUpTts() async {
    await _tts.setLanguage('zh-Cn');
    print(_tts.getLanguages);
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(0.5);

  }
  _runTts({required String text}) async {
    try{

      await _tts.speak(text);
    }catch(e){
      print("-----");
      print(e.toString());
    }
  }
}
