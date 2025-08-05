import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/shimmer_effect.dart';

class GenericCarousel<T> extends StatelessWidget {
  const GenericCarousel({
    required this.items,
    required this.coverImageUrlGetter,
    required this.onItemTap,
    super.key,
    this.isLoading = false,
    this.shimmerCount = 3,
    this.borderRadius = 12.0,
    this.viewportFraction = 0.8,
    this.aspectRatio = 16 / 9,
    this.autoPlay = true,
  });

  final List<T> items;
  final String? Function(T item) coverImageUrlGetter;
  final void Function(T item) onItemTap;
  final bool isLoading;

  final int shimmerCount;
  final double borderRadius;
  final double viewportFraction;
  final double aspectRatio;
  final bool autoPlay;

  @override
  Widget build(final BuildContext context) {
    final int effectiveShimmerCount = shimmerCount.clamp(1, 6);
    final int itemCount = isLoading ? effectiveShimmerCount : items.length;

    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: (
        final BuildContext context,
        final int index,
        final int realIndex,
      ) {
        if (isLoading) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: ShimmerEffect(
              width: double.infinity,
              height: double.infinity,
              radius: borderRadius,
            ),
          );
        }

        final T item = items[index];
        final String? imageUrl = coverImageUrlGetter(item);
        return GestureDetector(
          onTap: () => onItemTap(item),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              imageUrl ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (
                final BuildContext context,
                final Widget child,
                final ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                }
                return const ShimmerEffect(
                  width: double.infinity,
                  height: double.infinity,
                );
              },
              errorBuilder:
                  (
                    final BuildContext context,
                    final Object error,
                    final StackTrace? stackTrace,
                  ) => Center(child: SvgPicture.asset(AppAssets.appTextLogo)),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        height: double.infinity,
        enlargeCenterPage: true,
        aspectRatio: aspectRatio,
      ),
    );
  }
}
