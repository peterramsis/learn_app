

import 'package:flutter/material.dart';
import 'package:learn/config/contstants.dart';
import 'package:learn/enum/slide_direction.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({Key? key , required this.child , required this.direction ,this.animationDuration = kSlideAwayDuration,  this.animationDaly = 0 , this.animationCompleted ,this.reset, this.animate = true}) : super(key: key);

  final Widget child;
  final SlideDirection direction;
  final bool animate;
  final bool? reset;
  final VoidCallback? animationCompleted;
  final int animationDaly;
  final int animationDuration;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>  with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;


  @override
  initState() {
    _animationController = AnimationController(
        duration:  Duration(milliseconds: widget.animationDuration), vsync: this)..addListener(() {
      if (_animationController.isCompleted) {
        widget.animationCompleted?.call();
      }
    });



    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlideAnimation oldWidget) {


    if (widget.reset == true) {
      _animationController.reset();
    }
    if(widget.animate){
      if(widget.animationDaly > 0){
        Future.delayed(Duration(microseconds: widget.animationDaly),(){
          if(mounted){
            _animationController.forward();
          }

        });
      }else{
        _animationController.forward();
      }
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> animtaion;
    Tween<Offset> tween;
    switch (widget.direction) {
      case SlideDirection.leftAway:
        tween = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0));
        break;
      case SlideDirection.rightAway:
        tween = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0));
        break;
      case SlideDirection.leftIn:
        tween = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.rightIn:
        tween = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.upIn:
        tween = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      case SlideDirection.none:
        tween = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0));
        break;
    }

    animtaion = tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    return SlideTransition(position: animtaion, child: widget.child);
  }
}
