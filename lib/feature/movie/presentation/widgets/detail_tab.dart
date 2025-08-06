import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({required this.movie, super.key});

  final MovieEntity movie;

  @override
  Widget build(final BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 24),
    children: <Widget>[
      _labelText(context.locale.duration, context),
      _valueText('${movie.duration ?? '-'} min', context),
      const SizedBox(height: 6),
      _labelText(context.locale.director, context),
      _valueText(movie.directedBy, context),
      const SizedBox(height: 6),
      _labelText(context.locale.releaseDate, context),
      _valueText(
        movie.releaseDate?.toIso8601String().split('T').first,
        context,
      ),
    ],
  );

  Widget _labelText(final String text, final BuildContext context) => Text(
    text,
    style: AppTextStyles.continueTxtStyle.copyWith(
      fontSize: 16,
      color: context.appColors.white,
    ),
    textAlign: TextAlign.center,
  );

  Widget _valueText(final String? text, final BuildContext context) => Text(
    text ?? '-',
    style: AppTextStyles.overviewTxt.copyWith(
      fontSize: 12,
      color: context.appColors.white,
    ),
    textAlign: TextAlign.center,
  );
}
