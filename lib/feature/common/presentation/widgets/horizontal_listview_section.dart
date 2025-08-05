import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/shimmer_effect.dart';

class HorizontalListViewSection<T> extends StatelessWidget {
  const HorizontalListViewSection({
    required this.items,
    required this.title,
    required this.onItemTap,
    required this.coverImageUrlGetter,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.itemSpacing = 20.0,
    this.itemAspectRatio = 60 / 100,
    this.heightFactor = 0.22,
    this.placeholder,
    super.key,
    this.isLoading = false,
    this.shimmerItemCount = 3,
    this.shimmerBorderRadius = 12.0,
  });

  final List<T> items;
  final String title;
  final EdgeInsets padding;
  final void Function(T item) onItemTap;
  final String? Function(T item) coverImageUrlGetter;

  final double itemSpacing;
  final double itemAspectRatio;
  final double heightFactor;
  final Widget? placeholder;

  final bool isLoading;
  final int shimmerItemCount;
  final double shimmerBorderRadius;

  @override
  Widget build(final BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(title, style: AppTextStyles.sectionTitle),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * heightFactor,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: padding,
          itemCount: isLoading ? shimmerItemCount : items.length,
          itemBuilder: (final BuildContext context, final int index) {
            if (isLoading) {
              return _buildShimmerCard();
            }
            final T item = items[index];
            return _buildCard(context, item);
          },
          separatorBuilder:
              (final BuildContext context, final int index) =>
              SizedBox(width: itemSpacing),
        ),
      ),
    ],
  );

  Widget _buildCard(final BuildContext context, final T item) {
    final String? url = coverImageUrlGetter(item);
    return GestureDetector(
      onTap: () => onItemTap(item),
      child: AspectRatio(
        aspectRatio: itemAspectRatio,
        child: url != null
            ? Image.network(
          url,
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
              ) =>
          placeholder ?? const Icon(Icons.image_not_supported),
        )
            : Center(child: placeholder ?? const Icon(Icons.image)),
      ),
    );
  }

  Widget _buildShimmerCard() => AspectRatio(
    aspectRatio: itemAspectRatio,
    child: Padding(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(shimmerBorderRadius),
        child: const ShimmerEffect(
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    ),
  );
}
