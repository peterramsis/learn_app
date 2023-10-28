import 'package:flutter/material.dart';
import 'package:learn/utils/methods.dart';
class TopicTitle extends StatelessWidget {
  final String topic;
  const TopicTitle({Key? key ,required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Hero(tag: topic, child: Image.asset("assets/images/$topic.png")),
              ),
            ),
            Expanded(child: Text(topic))
          ],
        ),
      ),
      onTap: (){
         print(topic);
         loadSession(context , topic);
      },
    );
  }
}
