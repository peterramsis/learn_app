import 'package:flutter/material.dart';
import 'package:learn/notifiers/FlashcardNotifier.dart';
import 'package:learn/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';

void main() {
  runApp(MultiProvider(providers:  [
    ChangeNotifierProvider(create: (_) => FlashcardsNotifier())
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}

