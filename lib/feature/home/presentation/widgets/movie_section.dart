import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/movie_carousel.dart';

class MovieSection extends StatelessWidget {

  const MovieSection({
    required this.title, required this.movies,required this.onMovieTap, super.key,
  });
  final String title;
  final List<MovieEntity> movies;
  final void Function(MovieEntity movie) onMovieTap;


  @override
  Widget build(final BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: AppTextStyles.sectionTitle,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.22,
          child: MovieCarousel(movies: movies,onMovieTap: onMovieTap,),
        ),
      ],
    );
}