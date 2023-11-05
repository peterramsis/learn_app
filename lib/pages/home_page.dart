import 'package:flutter/material.dart';
import 'package:learn/animations/fade_in_animations.dart';
import 'package:learn/components/home_page/topic_title.dart';
import 'package:learn/data/words.dart';

import '../config/contstants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _topics = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(var topics in words){
       if(!_topics.contains(topics.topic)){
         _topics.add(topics.topic);
       }
       _topics.sort();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        toolbarHeight: size.height * 0.15,
        title:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * kIconPadding,
              child: Image.asset("assets/images/Settings.png"),
            ),
            const Text(
              'Learn Chinese',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: size.width * kIconPadding,
              child: Image.asset("assets/images/Review.png"),
            ),
          ],
        ),

      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: paddingWidth * 0.04,
          right: paddingWidth * 0.04,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: FadeInAnimation(child: Image.asset("assets/images/Dragon.png")),
                ),
              ),
            ),
            SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: _topics.length,
              (context, index) => FadeInAnimation(child: TopicTitle(topic: _topics[index])),
            ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6
            ))
          ],
        ),
      ),
    );

  }
}
