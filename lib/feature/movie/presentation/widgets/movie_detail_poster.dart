import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class MovieDetailPoster extends StatelessWidget {
  const MovieDetailPoster({required this.movie, super.key});

  final MovieEntity movie;

  @override
  Widget build(final BuildContext context) => Container(
    height: MediaQuery.sizeOf(context).height * 0.6,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(movie.coverUrl ?? ''),
        fit: BoxFit.cover,
        onError: (final Object error, final StackTrace? stackTrace) {},
      ),
    ),
    foregroundDecoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.transparent, AppColors.black],
        stops: <double>[0.5, 1],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: AlignmentDirectional.topStart,
          child: IconButton(
            onPressed: () => context.router.pop(),
            icon: const Icon(
              Icons.keyboard_backspace,
              size: 32,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 88),
          child: Text(
            movie.title ?? "",
            textAlign: TextAlign.center,
            style: AppTextStyles.movieDetailTitle,
          ),
        ),
      ],
    ),
  );
}
