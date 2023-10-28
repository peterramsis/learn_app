

import 'package:flutter/material.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/flash_card_page.dart';
import 'package:provider/provider.dart';

loadSession(BuildContext context , String topic){
  Navigator.push(context, MaterialPageRoute(builder: (context) => const FlashcardsPage()));
  Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: topic);
}