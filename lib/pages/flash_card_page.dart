import 'package:flutter/material.dart';
import 'package:learn/animations/half_filp_animation.dart';
import 'package:learn/animations/slide_animation.dart';
import 'package:learn/components/app/CustomAppBar.dart';
import 'package:learn/components/flash_card_page/card_one.dart';
import 'package:learn/components/flash_card_page/card_two.dart';
import 'package:learn/config/contstants.dart';
import 'package:learn/enum/slide_direction.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/home_page.dart';
import 'package:provider/provider.dart';
class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(builder: (_, notifier, __){
      return  Scaffold(
        appBar:  const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: CustomAppBar(),
        ),
        body: GestureDetector(
          onDoubleTap: (){
            notifier.runFlipCardOne();
          },
          child:const Stack(
            children: [
              CardTwo(),
              CardOne()
            ],
          ),
        ),
      );
    });
  }


}

