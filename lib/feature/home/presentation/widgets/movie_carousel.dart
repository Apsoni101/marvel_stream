import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({
    required this.movies,
    required this.onMovieTap,
    super.key,
  });

  final List<MovieEntity> movies;

  /// Callback when a movie is tapped
  final void Function(MovieEntity movie) onMovieTap;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(
        child: Text(
          AppStrings.noMoviesAvailable,
          style: AppTextStyles.continueTxtStyle,
        ),
      );
    }

    return CarouselSlider(
      items: movies.map(
            (final MovieEntity movie) {
          return GestureDetector(
            onTap: () => onMovieTap(movie),
            child: Image.network(
              movie.coverUrl ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                  ) {
                if (loadingProgress == null) return child;

                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.red,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (
                  BuildContext context,
                  Object error,
                  StackTrace? stackTrace,
                  ) {
                return Center(
                  child: SvgPicture.asset(AppAssets.appTextLogo),
                );
              },
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: double.infinity,
        enlargeCenterPage: true,
      ),
    );
  }
}
