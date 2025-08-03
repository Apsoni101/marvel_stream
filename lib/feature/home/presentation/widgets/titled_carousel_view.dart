import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class TitledCarouselView extends StatelessWidget {
  const TitledCarouselView({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(final BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: AppTextStyles.sectionTitle,
        ),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.18,
        child: CarouselSlider(
          items: children,
          options: CarouselOptions(autoPlay: true),
        ),
      ),
    ],
  );
}
