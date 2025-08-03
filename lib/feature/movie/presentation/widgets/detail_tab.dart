import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({required this.movie, super.key});

  final MovieEntity movie;

  @override
  Widget build(final BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 24),
    children: <Widget>[
      _labelText(AppStrings.duration),
      _valueText('${movie.duration ?? '-'} min'),
      const SizedBox(height: 6),
      _labelText(AppStrings.director),
      _valueText(movie.directedBy),
      const SizedBox(height: 6),
      _labelText(AppStrings.releaseDate),
      _valueText(movie.releaseDate?.toIso8601String().split('T').first),
    ],
  );

  Widget _labelText(final String text) => Text(
    text,
    style: AppTextStyles.continueTxtStyle.copyWith(fontSize: 16),
    textAlign: TextAlign.center,
  );

  Widget _valueText(final String? text) => Text(
    text ?? '-',
    style: AppTextStyles.overviewTxt.copyWith(fontSize: 12),
    textAlign: TextAlign.center,
  );
}
