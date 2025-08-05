import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/enums/character_section_type.dart';
import 'package:marvel_stream/core/enums/section_status.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/section_state.dart';
import 'package:marvel_stream/feature/characters/presentation/bloc/characters_bloc.dart';
import 'package:marvel_stream/feature/characters/presentation/widgets/characters_shimmer.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/generic_carousel_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/horizontal_listview_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/masonry_gridview_section.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/home_screen_app_bar.dart';


@RoutePage()
class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<CharactersBloc>(
    create:
        (final BuildContext context) =>
            AppInjector.getIt<CharactersBloc>()
              ..add(const FetchCharacterLists()),
    child: Scaffold(
      appBar: const HomeScreenAppBar(),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder:
            (final BuildContext context, final CharactersState state) =>
                switch (state) {
                  CharactersInitial() => const CharactersShimmer(),
                  CharactersReady() => _buildContent(context, state),
                },
      ),
    ),
  );

  Widget _buildContent(
    final BuildContext context,
    final CharactersReady state,
  ) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 30),
    children: <Widget>[
      _buildSection(
        title: AppStrings.featuredCharacters,
        sectionState: state.featuredCharacters,
        type: CharacterSectionType.carousel,
      ),
      _buildSection(
        title: AppStrings.classicCharacters,
        sectionState: state.classicCharacters,
        type: CharacterSectionType.grid,
      ),
      _buildSection(
        title: AppStrings.avengersCharacters,
        sectionState: state.avengersCharacters,
        type: CharacterSectionType.horizontal,
      ),
      _buildSection(
        title: AppStrings.spiderVerseCharacters,
        sectionState: state.spiderVerseCharacters,
        type: CharacterSectionType.grid,
      ),
      _buildSection(
        title: AppStrings.xMenCharacters,
        sectionState: state.xMenCharacters,
        type: CharacterSectionType.horizontal,
      ),
      _buildSection(
        title: AppStrings.hulkFamilyCharacters,
        sectionState: state.hulkCharacters,
        type: CharacterSectionType.grid,
      ),
      _buildSection(
        title: AppStrings.guardiansCharacters,
        sectionState: state.guardiansCharacters,
        type: CharacterSectionType.horizontal,
      ),
      _buildSection(
        title: AppStrings.aToZCharacters,
        sectionState: state.aToZCharacters,
        type: CharacterSectionType.grid,
      ),
    ],
  );

  /// Generic section builder that handles loading, loaded and error states.
  Widget _buildSection({
    required final String title,
    required final SectionState<CharacterEntity> sectionState,
    required final CharacterSectionType type,
  }) {
    switch (sectionState.status) {
      case SectionStatus.initial:
      case SectionStatus.loading:
        return _buildLoadingSection(title, type);
      case SectionStatus.loaded:
        return _buildLoadedSection(title, sectionState.items, type);
      case SectionStatus.error:
        return _buildErrorSection(
          title,
          sectionState.errorMessage ?? 'Unknown error',
          isCarousel: type == CharacterSectionType.carousel,
        );
    }
  }

  /// Returns the loading (shimmer) variant for the given type.
  Widget _buildLoadingSection(
    final String title,
    final CharacterSectionType type,
  ) {
    switch (type) {
      case CharacterSectionType.carousel:
        return GenericCarouselSection<CharacterEntity>(
          title: title,
          items: const <CharacterEntity>[],
          coverImageUrlGetter:
              (final CharacterEntity character) =>
                  character.thumbnail?.fullUrl ?? "",
          onItemTap: _handleCharacterTap,
          isLoading: true,
        );
      case CharacterSectionType.horizontal:
        return HorizontalListViewSection<CharacterEntity>(
          title: title,
          items: const <CharacterEntity>[],
          onItemTap: _handleCharacterTap,
          coverImageUrlGetter:
              (final CharacterEntity character) =>
                  character.thumbnail?.fullUrl ?? "",
          isLoading: true,
        );
      case CharacterSectionType.grid:
        return MasonryGridViewItemSection<CharacterEntity>(
          title: title,
          items: const <CharacterEntity>[],
          onItemTap: _handleCharacterTap,
          coverImageUrlGetter:
              (final CharacterEntity character) =>
                  character.thumbnail?.fullUrl ?? "",
          isLoading: true,
        );
    }
  }

  /// Returns the loaded (real data) variant for the given type.
  Widget _buildLoadedSection(
    final String title,
    final List<CharacterEntity> items,
    final CharacterSectionType type,
  ) {
    switch (type) {
      case CharacterSectionType.carousel:
        return GenericCarouselSection<CharacterEntity>(
          title: title,
          items: items,
          coverImageUrlGetter:
              (final CharacterEntity character) =>
                  character.thumbnail?.fullUrl ?? "",
          onItemTap: _handleCharacterTap,
        );
      case CharacterSectionType.horizontal:
        return HorizontalListViewSection<CharacterEntity>(
          title: title,
          items: items,
          onItemTap: _handleCharacterTap,
          coverImageUrlGetter:
              (final CharacterEntity character) =>
                  character.thumbnail?.fullUrl ?? "",
        );
      case CharacterSectionType.grid:
        return MasonryGridViewItemSection<CharacterEntity>(
          title: title,
          items: items,
          onItemTap: _handleCharacterTap,
          coverImageUrlGetter:
              (final CharacterEntity character) =>
                  character.thumbnail?.fullUrl ?? "",
        );
    }
  }

  /// Error UI (same as your existing implementation).
  Widget _buildErrorSection(
    final String title,
    final String errorMessage, {
    final bool isCarousel = false,
  }) => Container(
    margin: const EdgeInsets.all(18),
    child: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: AppTextStyles.sectionTitle,
          ),
        ),
        const SizedBox(height: 12),
        const Icon(Icons.error_outline, color: AppColors.red, size: 32),
        const SizedBox(height: 8),
        Text(
          'Error loading $title',
          style: AppTextStyles.overviewTxt.copyWith(color: AppColors.red),
        ),
        const SizedBox(height: 4),
        Text(
          errorMessage,
          style: AppTextStyles.overviewTxt.copyWith(color: AppColors.red),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

  void _handleCharacterTap(final CharacterEntity character) {
    debugPrint('Character tapped: ${character.name}');
  }
}
