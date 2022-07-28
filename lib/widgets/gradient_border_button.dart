import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  const GradientButton({
    Key? key,
    required this.gradient,
    required this.child,
    required this.onPressed,
    this.duration = const Duration(milliseconds: 500),
    this.isGradientAnimated = false,
    this.colors = const [
      Colors.grey,
      Colors.blueGrey,
    ],
    this.alignments = const [
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.topLeft,
      Alignment.topRight,
    ],
    this.borderWidth = 5,
    this.borderRadius = 0,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 16.0,
    ),
  }) : super(key: key);

  final Gradient gradient;
  final Widget child;
  final Duration duration;
  final bool isGradientAnimated;
  final VoidCallback onPressed;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets padding;
  final List<MaterialColor> colors;
  final List<Alignment> alignments;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..repeat(reverse: true);

  late final Animation _animation =
      IntTween(begin: 0, end: 3).animate(_animationController);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: widget.isGradientAnimated
                ? LinearGradient(
                    colors: widget.colors,
                    begin: widget.alignments[
                        _animation.value % widget.alignments.length],
                    end: widget.alignments[
                        (_animation.value + 2) % widget.alignments.length],
                  )
                : widget.gradient,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.all(widget.borderWidth),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        ),
        child: widget.child,
      ),
    );
  }
}
