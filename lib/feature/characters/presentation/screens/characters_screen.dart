import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/enums/character_section_type.dart';
import 'package:marvel_stream/core/enums/section_status.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/section_state.dart';
import 'package:marvel_stream/feature/characters/presentation/bloc/characters_bloc.dart';
import 'package:marvel_stream/feature/characters/presentation/widgets/characters_shimmer.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/error_section_widget.dart';
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
        context: context,
        title: AppStrings.featuredCharacters,
        sectionState: state.featuredCharacters,
        type: CharacterSectionType.carousel,
      ),
      _buildSection(
        context: context,
        title: AppStrings.classicCharacters,
        sectionState: state.classicCharacters,
        type: CharacterSectionType.grid,
      ),
      _buildSection(
        context: context,
        title: AppStrings.avengersCharacters,
        sectionState: state.avengersCharacters,
        type: CharacterSectionType.horizontal,
      ),
      _buildSection(
        context: context,
        title: AppStrings.spiderVerseCharacters,
        sectionState: state.spiderVerseCharacters,
        type: CharacterSectionType.grid,
      ),
      _buildSection(
        context: context,
        title: AppStrings.xMenCharacters,
        sectionState: state.xMenCharacters,
        type: CharacterSectionType.horizontal,
      ),
      _buildSection(
        context: context,
        title: AppStrings.hulkFamilyCharacters,
        sectionState: state.hulkCharacters,
        type: CharacterSectionType.grid,
      ),
      _buildSection(
        context: context,
        title: AppStrings.guardiansCharacters,
        sectionState: state.guardiansCharacters,
        type: CharacterSectionType.horizontal,
      ),
      _buildSection(
        context: context,
        title: AppStrings.aToZCharacters,
        sectionState: state.aToZCharacters,
        type: CharacterSectionType.grid,
      ),
    ],
  );

  /// Generic section builder that handles loading, loaded and error states.
  Widget _buildSection({
    required final BuildContext context,
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
          context,
          title,
          sectionState.errorMessage ?? 'Unknown error',
          isCarousel: type == CharacterSectionType.carousel,
          retryEvent: switch (type) {
            CharacterSectionType.carousel =>
                const FetchFeaturedCharacters(limit: 10),
            CharacterSectionType.grid => switch (title) {
              AppStrings.classicCharacters =>
                  const FetchClassicCharacters(limit: 10),
              AppStrings.spiderVerseCharacters =>
                  const FetchSpiderVerseCharacters(limit: 10),
              AppStrings.hulkFamilyCharacters =>
                  const FetchHulkCharacters(limit: 10),
              AppStrings.aToZCharacters =>
                  const FetchAToZCharacters(limit: 100),
              _ => const FetchCharacterLists(),
            },
            CharacterSectionType.horizontal => switch (title) {
              AppStrings.avengersCharacters =>
                  const FetchAvengersCharacters(limit: 10),
              AppStrings.xMenCharacters =>
                  const FetchXMenCharacters(limit: 10),
              AppStrings.guardiansCharacters =>
                  const FetchGuardiansCharacters(limit: 10),
              _ => const FetchCharacterLists(),
            },
          },
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
      final BuildContext context,
      final String title,
      final String errorMessage, {
        required final CharactersEvent retryEvent,
        final bool isCarousel = false,
      }) =>
      ErrorSectionWidget(
        title: title,
        errorMessage: errorMessage,
        isCarousel: isCarousel,
        onRetry: () {
          context.read<CharactersBloc>().add(retryEvent);
        },
      );

  void _handleCharacterTap(final CharacterEntity character) {
    debugPrint('Character tapped: ${character.name}');
  }
}
