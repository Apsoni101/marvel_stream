import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class ErrorSectionWidget extends StatefulWidget {
  const ErrorSectionWidget({
    required this.title,
    required this.errorMessage,
    super.key,
    this.isCarousel = false,
    this.onRetry,
    this.animateRetry = true,
  });

  final String title;
  final String errorMessage;
  final bool isCarousel;

  /// Called when retry icon is pressed. If null, retry icon won't be shown.
  final VoidCallback? onRetry;

  /// If true, the retry icon will rotate when tapped.
  final bool animateRetry;

  @override
  State<ErrorSectionWidget> createState() => _ErrorSectionWidgetState();
}

class _ErrorSectionWidgetState extends State<ErrorSectionWidget>
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
    if (widget.animateRetry) {
      _controller.repeat();
      Future<void>.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          _controller.stop();
        }
      });
    }
    widget.onRetry?.call();
  }

  @override
  Widget build(final BuildContext context) => ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(18),
    children: <Widget>[
      Text(widget.title, style: AppTextStyles.sectionTitle),
      const SizedBox(height: 12),
      const Icon(Icons.error_outline, color: AppColors.red, size: 32),
      const SizedBox(height: 8),
      Text(
        textAlign: TextAlign.center,
        'Error loading ${widget.title}',
        style: AppTextStyles.overviewTxt.copyWith(color: AppColors.red),
      ),
      const SizedBox(height: 4),
      Text(
        widget.errorMessage,
        style: AppTextStyles.overviewTxt.copyWith(color: AppColors.red),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 8),
      if (widget.onRetry != null)
        RotationTransition(
          turns:
              widget.animateRetry
                  ? _controller
                  : const AlwaysStoppedAnimation<double>(0),
          child: IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.red),
            onPressed: _handleTap,
          ),
        ),
    ],
  );
}
