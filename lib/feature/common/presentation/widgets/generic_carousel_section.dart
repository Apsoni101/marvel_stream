import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/generic_carousel.dart';

class GenericCarouselSection<T> extends StatelessWidget {
  const GenericCarouselSection({
    required this.title,
    required this.items,
    required this.coverImageUrlGetter,
    required this.onItemTap,
    super.key,
    this.heightFactor = 0.22,
    this.isLoading = false,
  });

  final String title;
  final List<T> items;
  final String? Function(T item) coverImageUrlGetter;
  final void Function(T item) onItemTap;
  final double heightFactor;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) => Column(
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
      SizedBox(
        height: MediaQuery.sizeOf(context).height * heightFactor,
        child: GenericCarousel<T>(
          items: items,
          coverImageUrlGetter: coverImageUrlGetter,
          onItemTap: onItemTap,
          isLoading: isLoading,
        ),
      ),
    ],
  );
}
