import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/shimmer_effect.dart';

class MasonryGridViewItemSection<T> extends StatelessWidget {
  const MasonryGridViewItemSection({
    required this.items,
    required this.title,
    required this.onItemTap,
    required this.coverImageUrlGetter,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 12,
    this.crossAxisSpacing = 12,
    this.bookmarkAssetPath = AppAssets.bookmarkIc,
    this.isLoading = false,
    this.shimmerItemCount,
    this.borderRadius = 12.0,
    this.placeholderAspectRatio = 2 / 3,
  });

  final List<T> items;
  final String title;
  final EdgeInsets padding;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  final void Function(T item) onItemTap;
  final String? Function(T item) coverImageUrlGetter;
  final String bookmarkAssetPath;

  final bool isLoading;
  final int? shimmerItemCount;
  final double borderRadius;
  final double placeholderAspectRatio;

  @override
  Widget build(final BuildContext context) {
    final int effectiveShimmerCount = shimmerItemCount ?? (crossAxisCount * 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(title, style: AppTextStyles.sectionTitle),
        ),
        MasonryGridView.count(
          padding: padding,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          itemCount: isLoading ? effectiveShimmerCount : items.length,
          itemBuilder: (final BuildContext context, final int index) {
            if (isLoading) {
              return _buildShimmerCard();
            }
            final T item = items[index];
            return GestureDetector(
              onTap: () => onItemTap(item),
              child: _buildCard(item),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCard(final T item) => ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child:
        coverImageUrlGetter(item) != null
            ? Image.network(
              coverImageUrlGetter(item)!,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (
                final BuildContext context,
                final Widget child,
                final ImageChunkEvent? progress,
              ) {
                if (progress == null) {
                  return child;
                }
                return AspectRatio(
                  aspectRatio: placeholderAspectRatio,
                  child: const ShimmerEffect(
                    width: double.infinity,
                    height: double.infinity,
                    radius: 12,
                  ),
                );
              },
              errorBuilder:
                  (
                    final BuildContext context,
                    final Object error,
                    final StackTrace? stackTrace,
                  ) => _buildPlaceholder(),
            )
            : _buildPlaceholder(),
  );

  Widget _buildPlaceholder() => AspectRatio(
    aspectRatio: placeholderAspectRatio,
    child: const ColoredBox(
      color: AppColors.lightGrey,
      child: Center(child: Icon(Icons.movie, size: 40, color: AppColors.white)),
    ),
  );

  Widget _buildShimmerCard() => ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: AspectRatio(
      aspectRatio: placeholderAspectRatio,
      child: const ShimmerEffect(
        width: double.infinity,
        height: double.infinity,
        radius: 12,
      ),
    ),
  );
}
