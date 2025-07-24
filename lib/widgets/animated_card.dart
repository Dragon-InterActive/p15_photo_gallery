import 'package:flutter/material.dart';
import 'package:p15_bildergalerie/widgets/animated_gradient_border.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration animationDuration;
  final bool autoStart;

  const AnimatedCard({
    super.key,
    required this.child,
    this.onTap,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.autoStart = false,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  final GlobalKey<AnimatedGradientBorderState> _borderKey = GlobalKey();

  void _handleTap() {
    _borderKey.currentState?.startAnimation();
  }

  void _onAnimationComplete() {
    widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedGradientBorder(
        key: _borderKey,
        autoStart: widget.autoStart,
        duration: widget.animationDuration,
        borderWidth: 4,
        borderRadius: 12,
        colors: const [
          //Color(0xFF3E0102),
          Color(0xFF9B0406),
          Color(0xFFCCAC00),
          Color(0xFF9B0406),
          Color(0xFFCCAC00),
          //Color(0xFFE2E2E2),
        ],
        onAnimationComplete: _onAnimationComplete,
        child: widget.child,
      ),
    );
  }
}
