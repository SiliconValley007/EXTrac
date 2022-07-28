//draws the progress bar
import 'dart:math';

import 'package:extrac/core/core.dart';
import 'package:flutter/material.dart';

class CircleProgressBar extends StatefulWidget {
  const CircleProgressBar({
    Key? key,
    this.animationDuration = const Duration(seconds: 1),
    this.backgroundColor = AppColors.lightBlack,
    required this.value,
    this.strokeWidth = 6,
    this.radius,
    this.onTap,
  })  : percentageValue = value <= 100 ? value / 100 : 100,
        assert(value >= 0),
        super(key: key);

  final Duration animationDuration;
  final Color backgroundColor;
  final double value;
  final double percentageValue;
  final double strokeWidth;
  final double? radius;
  final Function(AnimationStatus animationStatus)? onTap;

  @override
  State<CircleProgressBar> createState() => _CircleProgressBarState();
}

class _CircleProgressBarState extends State<CircleProgressBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _curve;
  late Tween<double> _valueTween;
  ColorTween? backgroundColorTween;
  ColorTween? foregroundColorTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    // Build the initial required tweens.
    _valueTween = Tween<double>(
      begin: 0,
      end: widget.percentageValue,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CircleProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.percentageValue != oldWidget.percentageValue) {
      // Try to start with the previous tween's end value. This ensures that we
      // have a smooth transition from where the previous animation reached.
      double beginValue = _valueTween.evaluate(_curve);

      // Update the value tween.
      _valueTween = Tween<double>(
        begin: beginValue,
        end: widget.percentageValue,
      );

      // Clear cached color tweens when the color hasn't changed.
      if (oldWidget.backgroundColor != widget.backgroundColor) {
        backgroundColorTween = ColorTween(
          begin: oldWidget.backgroundColor,
          end: widget.backgroundColor,
        );
      } else {
        backgroundColorTween = null;
      }

      foregroundColorTween = ColorTween(
        begin: AppMethods.percentageColor(oldWidget.value),
        end: AppMethods.percentageColor(widget.value),
      );

      _animationController
        ..reset()
        ..forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call(_animationController.status);
      },
      child: SizedBox(
        width: widget.radius,
        height: widget.radius,
        child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedBuilder(
            animation: _curve,
            child: FractionallySizedBox(
              widthFactor: 0.6,
              heightFactor: 0.6,
              child: FittedBox(
                child: AnimatedDefaultTextStyle(
                  duration: widget.animationDuration,
                  style: TextStyle(
                    color: AppMethods.percentageColor(widget.value),
                    fontWeight: FontWeight.normal,
                  ),
                  child: Text(
                    '${(widget.value).toInt()}%',
                    textAlign: TextAlign.center,
                    maxLines: null,
                  ),
                ),
              ),
            ),
            builder: (context, child) {
              final backgroundColor = backgroundColorTween?.evaluate(_curve) ??
                  widget.backgroundColor;
              final foregroundColor = foregroundColorTween?.evaluate(_curve) ??
                  AppMethods.percentageColor(widget.value);

              return CustomPaint(
                foregroundPainter: CircleProgressBarPainter(
                  backgroundColor: backgroundColor,
                  foregroundColor: foregroundColor,
                  percentage: _valueTween.evaluate(_curve),
                  strokeWidth: widget.strokeWidth,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color? backgroundColor;
  final Color foregroundColor;

  CircleProgressBarPainter({
    required this.percentage,
    required this.strokeWidth,
    this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final constrainedSize = (size - Offset(strokeWidth, strokeWidth)) as Size;
    final shortestSide = min(constrainedSize.width, constrainedSize.height);
    final foregroundPaint = Paint()
      ..color = foregroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final radius = (shortestSide / 2);

    // Start at the top. 0 radians represents the right edge
    const double startAngle = -(2 * pi * 0.25);
    final double sweepAngle = (2 * pi * percentage);

    // Don't draw the background if we don't have a background color
    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = backgroundColor!
        ..strokeWidth = strokeWidth * 2
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircleProgressBarPainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.foregroundColor != foregroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
