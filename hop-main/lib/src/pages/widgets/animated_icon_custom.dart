import 'package:flutter/material.dart';

class AnimateIconCustom extends StatefulWidget {
  const AnimateIconCustom({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimateIconCustom> createState() => _AnimateIconCustomState();
}

class _AnimateIconCustomState extends State<AnimateIconCustom>
    with SingleTickerProviderStateMixin {
  // AnimationController? _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite_border,
          color: Colors.red,
          size: 30.0,
        ));
  }
}
