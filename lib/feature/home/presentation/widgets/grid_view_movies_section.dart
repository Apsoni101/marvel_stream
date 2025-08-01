import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class GridViewMoviesSection extends StatelessWidget {
  const GridViewMoviesSection({
    required this.movies,
    required this.title,
    required this.onMovieTap,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 12,
    this.crossAxisSpacing = 12,
    this.childAspectRatio = 0.6,
  });

  final List<MovieEntity> movies;
  final String title;
  final EdgeInsets padding;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;

  final void Function(MovieEntity movie) onMovieTap;

  @override
  Widget build(final BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(title, style: AppTextStyles.sectionTitle),
      ),
      GridView.builder(
        padding: padding,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (final BuildContext context, final int index) {
          final MovieEntity movie = movies[index];
          return GestureDetector(
            onTap: () => onMovieTap(movie),
            child: _buildMovieCard(movie),
          );
        },
      ),
    ],
  );

  Widget _buildMovieCard(final MovieEntity movie) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Stack(
      children: <Widget>[
        if (movie.coverUrl != null) Image.network(
          movie.coverUrl!,
          fit: BoxFit.fill,
          errorBuilder: (
              final BuildContext context,
              final Object error,
              final StackTrace? stackTrace,
              ) =>
              _buildPlaceholder(),
        ) else _buildPlaceholder(),
        Positioned(child: Image.asset(AppAssets.bookmarkIc))
      ],
    ),
  );

  Widget _buildPlaceholder() => const ColoredBox(
    color: AppColors.lightGrey,
    child: Center(
      child: Icon(Icons.movie, size: 40, color: AppColors.white),
    ),
  );
}
