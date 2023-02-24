import 'package:flutter/material.dart';

class FadeStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const FadeStack({
    super.key,
    required this.index,
    required this.children,
  });

  @override
  FadeStackState createState() => FadeStackState();
}

class FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void didUpdateWidget(FadeStack oldWidget) {
    if (widget.index != oldWidget.index) {
      animationController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}