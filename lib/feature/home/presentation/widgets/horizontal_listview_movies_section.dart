import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class HorizontalLisViewMoviesSection extends StatelessWidget {
  const HorizontalLisViewMoviesSection({
    required this.movies,
    required this.title,
    required this.onMovieTap,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final List<MovieEntity> movies;
  final String title;
  final EdgeInsets padding;
  final void Function(MovieEntity movie) onMovieTap;

  @override
  Widget build(final BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(title, style: AppTextStyles.sectionTitle),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.22,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: padding,
          itemCount: movies.length,
          itemBuilder: (final BuildContext context, final int index) {
            final MovieEntity movie = movies[index];
            return _buildMovieCard(context, movie);
          },
          separatorBuilder:
              (final BuildContext context, final int index) =>
                  const SizedBox(width: 20),
        ),
      ),
    ],
  );

  Widget _buildMovieCard(BuildContext context, MovieEntity movie) =>
      GestureDetector(
        onTap: () => onMovieTap(movie),
        child: AspectRatio(
          aspectRatio: 60 / 100,
          child:
              movie.coverUrl != null
                  ? Image.network(
                    movie.coverUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder:
                        (final context, final error, final stackTrace) =>
                            const Icon(Icons.movie, size: 50),
                  )
                  : const Center(child: Icon(Icons.movie, size: 50)),
        ),
      );
}
