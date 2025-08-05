import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';

/// A retry button with rotation animation when pressed.
class AnimatedRetryButton extends StatefulWidget {

  const AnimatedRetryButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  State<AnimatedRetryButton> createState() => _AnimatedRetryButtonState();
}

class _AnimatedRetryButtonState extends State<AnimatedRetryButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.repeat();
    widget.onPressed();

    Future<void>.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(final BuildContext context) => RotationTransition(
    turns: _controller,
    child: IconButton(
      icon: const Icon(Icons.refresh, color: AppColors.red),
      onPressed: _handleTap,
    ),
  );
}
