import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/string_extensions.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class MoreInfoTab extends StatelessWidget {
  const MoreInfoTab({required this.movie, super.key});

  final MovieEntity movie;

  @override
  Widget build(final BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 24),
    children: <Widget>[
      _labelText(AppStrings.boxOffice),
      _valueText(movie.boxOffice.toInrBoxOffice()),
      const SizedBox(height: 6),
      _labelText(AppStrings.phase),
      _valueText('${movie.phase ?? '-'}'),
      const SizedBox(height: 6),
      _labelText(AppStrings.saga),
      _valueText(movie.saga),
      const SizedBox(height: 6),
      _labelText(AppStrings.chronology),
      _valueText('${movie.chronology ?? '-'}'),
      const SizedBox(height: 6),
      _labelText(AppStrings.postCreditScenes),
      _valueText('${movie.postCreditScenes ?? '-'}'),
      const SizedBox(height: 6),
      _labelText(AppStrings.imdbId),
      _valueText(movie.imdbId),
      const SizedBox(height: 6),
      _labelText(AppStrings.lastUpdated),
      _valueText(movie.updatedAt?.toIso8601String().split('T').first),
    ],
  );

  Widget _labelText(final String text) => Text(
    text,
    style: AppTextStyles.continueTxtStyle.copyWith(fontSize: 16),
    textAlign: TextAlign.center,
  );

  Widget _valueText(final String? text) => Text(
    text ?? '-',
    style: AppTextStyles.overviewTxt.copyWith(
      fontSize: 12,
      color: AppColors.white50,
    ),
    textAlign: TextAlign.center,
  );
}
