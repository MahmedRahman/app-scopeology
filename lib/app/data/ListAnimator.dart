import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnimator extends StatefulWidget {
  final List<Widget> children;
  final int duration;
  final double verticalOffset;
  final ScrollPhysics physics;

  const ListAnimator({
    Key key,
    this.children,
    this.duration,
    this.verticalOffset,
    this.physics,
  }) : super(key: key);

  @override
  _ListAnimatorState createState() => _ListAnimatorState();
}

class _ListAnimatorState extends State<ListAnimator> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: widget.children.length,
            shrinkWrap: true,
            physics: widget.physics,
            itemBuilder: (_, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget.children[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}