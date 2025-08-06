import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/shimmer_effect.dart';

class GridViewItemSection<T> extends StatelessWidget {
  const GridViewItemSection({
    required this.items,
    required this.title,
    required this.onItemTap,
    required this.coverImageUrlGetter,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 12,
    this.crossAxisSpacing = 12,
    this.childAspectRatio = 0.6,
    this.bookmarkAssetPath = AppAssets.bookmarkIc,
    this.isLoading = false,
    this.shimmerItemCount,
    this.borderRadius = 12.0,
  });

  final List<T> items;
  final String title;
  final EdgeInsets padding;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;

  final void Function(T item) onItemTap;
  final String? Function(T item) coverImageUrlGetter;
  final String bookmarkAssetPath;

  final bool isLoading;
  final int? shimmerItemCount;
  final double borderRadius;

  @override
  Widget build(final BuildContext context) {
    final int effectiveShimmerCount = shimmerItemCount ?? (crossAxisCount * 2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: AppTextStyles.sectionTitle.copyWith(
              color: context.appColors.white,
            ),
          ),
        ),
        GridView.builder(
          padding: padding,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: isLoading ? effectiveShimmerCount : items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (final BuildContext context, final int index) {
            if (isLoading) {
              return _buildShimmerCard();
            }

            final T item = items[index];
            return GestureDetector(
              onTap: () => onItemTap(item),
              child: _buildCard(item, context),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCard(final T item, final BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: Stack(
      children: <Widget>[
        if (coverImageUrlGetter(item) != null)
          Image.network(
            coverImageUrlGetter(item)!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (
              final BuildContext context,
              final Widget child,
              final ImageChunkEvent? progress,
            ) {
              if (progress == null) {
                return child;
              }
              return const ShimmerEffect(
                width: double.infinity,
                height: double.infinity,
                radius: 12,
              );
            },
            errorBuilder:
                (
                  final BuildContext context,
                  final Object error,
                  final StackTrace? stackTrace,
                ) => _buildPlaceholder(context),
          )
        else
          _buildPlaceholder(context),
        Positioned(
          child: Image.asset(bookmarkAssetPath, width: 28, height: 28),
        ),
      ],
    ),
  );

  Widget _buildPlaceholder(final BuildContext context) => ColoredBox(
    color: context.appColors.lightGrey,
    child: Center(
      child: Icon(Icons.movie, size: 40, color: context.appColors.white),
    ),
  );

  Widget _buildShimmerCard() => ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: const ShimmerEffect(
      width: double.infinity,
      height: double.infinity,
      radius: 12,
    ),
  );
}
