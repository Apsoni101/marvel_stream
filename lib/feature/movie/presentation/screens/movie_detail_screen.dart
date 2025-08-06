import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/custom_red_border_button.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/movie/presentation/bloc/movie_detail_bloc.dart';
import 'package:marvel_stream/feature/movie/presentation/widgets/movie_detail_poster.dart';
import 'package:marvel_stream/feature/movie/presentation/widgets/movie_detail_tabs.dart';

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({required this.movie, super.key});

  final MovieEntity movie;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => BlocProvider<MovieDetailBloc>(
    create:
        (final BuildContext context) => AppInjector.getIt<MovieDetailBloc>(),
    child: Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            MovieDetailPoster(movie: widget.movie),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomRedBorderButton(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                    text: context.locale.download,
                    backgroundColor: context.appColors.black,
                    side: BorderSide(width: 4, color: context.appColors.red),
                  ),
                  CustomRedBorderButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    backgroundColor: context.appColors.black,
                    text: context.locale.addToWatchlist,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.movie.overview ?? context.locale.noOverViewAvailable,
                style: AppTextStyles.overviewTxt.copyWith(
                  color: context.appColors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            MovieDetailTabs(movie: widget.movie, tabController: _tabController),
          ],
        ),
      ),
    ),
  );
}
