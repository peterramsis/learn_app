import 'package:flutter/material.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/flash_card_page.dart';
import 'package:learn/pages/home_page.dart';
import 'package:provider/provider.dart';
class ResultBox extends StatelessWidget {
  const ResultBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<FlashcardsNotifier>(builder: (_,notifier,__)=>AlertDialog(
      title: notifier.isSessionCompleted ? const Text("Session Completed") : const Text("Round Completed"),
      actions: [
        Table(
          children: [
            buildTableRow(
              title: "Round",
              number: notifier.roundTally
            ),
            buildTableRow(
                title: "Cards",
                number: notifier.cardTally
            ),
            buildTableRow(
                title: "correct",
                number: notifier.correctTally
            ),
            buildTableRow(
                title: "incorrect",
                number: notifier.incorrectTally
            ),
            buildTableRow(
                title: "Percentage",
                number: notifier.correctPercentage
            )
          ],
        ),
       Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           notifier.isSessionCompleted ? const SizedBox() : ElevatedButton(onPressed: (){
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const FlashcardsPage()));
           }, child: const Text("restart incorrect")),
           ElevatedButton(onPressed: (){
             notifier.reset();
             Navigator.pushAndRemoveUntil(
                 context,
                 MaterialPageRoute(builder: (context) =>const HomePage()), (route)=> false);
           }, child: const Text("Home"))
         ],
       )

      ],
    ));
  }

  TableRow buildTableRow({required String title , required int number}) {
    return TableRow(
            children: [
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              )),
              TableCell(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$number" , textAlign: TextAlign.right,),
              ))
            ]
          );
  }
}
