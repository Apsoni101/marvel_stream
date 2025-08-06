import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/core/extensions/string_extensions.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class MoreInfoTab extends StatelessWidget {
  const MoreInfoTab({required this.movie, super.key});

  final MovieEntity movie;

  @override
  Widget build(final BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 24),
    children: <Widget>[
      _labelText(context.locale.boxOffice, context),
      _valueText(movie.boxOffice.toInrBoxOffice(), context),
      const SizedBox(height: 6),
      _labelText(context.locale.phase, context),
      _valueText('${movie.phase ?? '-'}', context),
      const SizedBox(height: 6),
      _labelText(context.locale.saga, context),
      _valueText(movie.saga, context),
      const SizedBox(height: 6),
      _labelText(context.locale.chronology, context),
      _valueText('${movie.chronology ?? '-'}', context),
      const SizedBox(height: 6),
      _labelText(context.locale.postCreditScenes, context),
      _valueText('${movie.postCreditScenes ?? '-'}', context),
      const SizedBox(height: 6),
      _labelText(context.locale.imdbId, context),
      _valueText(movie.imdbId, context),
      const SizedBox(height: 6),
      _labelText(context.locale.lastUpdated, context),
      _valueText(movie.updatedAt?.toIso8601String().split('T').first, context),
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
      color: context.appColors.white50,
    ),
    textAlign: TextAlign.center,
  );
}
