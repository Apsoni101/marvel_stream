import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({
    required this.width,
    required this.height,
    super.key,
    this.radius = 0,
  });

  final double width;
  final double height;
  final double radius;

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    LinearGradient shimmerGradient = LinearGradient(
      colors: <Color>[
        context.appColors.baseColor,
        context.appColors.highlightColor,
        context.appColors.baseColor,
      ],
      stops: const <double>[0.25, 0.5, 0.75],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedBuilder(
          animation: _shimmerController,
          builder:
              (final BuildContext context, final Widget? child) => ShaderMask(
                shaderCallback: (final Rect bounds) {
                  final double width = bounds.width;
                  final double shimmerPosition =
                      _shimmerController.value * 2 - 1;
                  return shimmerGradient.createShader(
                    Rect.fromLTWH(
                      shimmerPosition * width,
                      0,
                      width,
                      bounds.height,
                    ),
                  );
                },
                blendMode: BlendMode.srcATop,
                child: child,
              ),
          child: Container(color: context.appColors.baseColor),
        ),
      ),
    );
  }
}
