import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedGradientBorder extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final List<Color> colors;
  final Duration duration;
  final double borderRadius;
  final bool autoStart;
  final VoidCallback? onAnimationComplete;

  AnimatedGradientBorder({
    super.key,
    required this.child,
    this.borderWidth = 3.0,
    this.colors = const [Colors.red, Colors.orange, Colors.yellow],
    this.duration = const Duration(seconds: 2),
    this.borderRadius = 8.0,
    this.autoStart = true,
    this.onAnimationComplete,
  });

  final GlobalKey<AnimatedGradientBorderState> _key = GlobalKey();

  void startAnimation() {
    _key.currentState?.startAnimation();
  }

  @override
  State<AnimatedGradientBorder> createState() => AnimatedGradientBorderState();
}

class AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    if (widget.autoStart) {
      _controller.repeat(); //Endlos wiederholen
    }

    //Listener für Animations-Ende wenn nicht Endlos laufen soll
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !widget.autoStart) {
        _isAnimating = false;
        widget.onAnimationComplete?.call();
      }
    });
  }

  void startAnimation() {
    if (!_isAnimating) {
      // wenn Animation noch nicht läuft
      _isAnimating = true;
      _controller.forward(from: 0); //Starte am Anfang der Animation
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: widget._key,
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: GradientBorderPainter(
            animation: _controller.value,
            borderWidth: widget.borderWidth,
            colors: widget.colors,
            borderRadius: widget.borderRadius,
          ),
          child: Container(
            margin: EdgeInsets.all(widget.borderWidth),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double animation;
  final double borderWidth;
  final double borderRadius;
  final List<Color> colors;

  GradientBorderPainter({
    required this.animation,
    required this.borderWidth,
    required this.borderRadius,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    //Gradient animieren / drehen
    final gradient = SweepGradient(
      colors: colors,
      //Animation Start-Winkel
      startAngle: animation * 2 * math.pi,
      endAngle: (animation * 2 * math.pi) + (2 * math.pi),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
