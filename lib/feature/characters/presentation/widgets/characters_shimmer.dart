import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/generic_carousel_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/horizontal_listview_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/masonry_gridview_section.dart';

/// Reusable shimmer/initial placeholder for the Characters screen.
/// This mirrors what characters screen after loading used to return.
class CharactersShimmer extends StatelessWidget {
  const CharactersShimmer({super.key});

  @override
  Widget build(final BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 30),
    children: <Widget>[
      GenericCarouselSection<CharacterEntity>(
        title: AppStrings.featuredCharacters,
        items: const <CharacterEntity>[],
        coverImageUrlGetter:
            (final CharacterEntity character) =>
                character.thumbnail?.fullUrl ?? "",
        onItemTap: (_) {},
        isLoading: true,
      ),
      HorizontalListViewSection<CharacterEntity>(
        title: AppStrings.aToZCharacters,
        items: const <CharacterEntity>[],
        onItemTap: (_) {},
        coverImageUrlGetter:
            (final CharacterEntity character) =>
                character.thumbnail?.fullUrl ?? "",
        isLoading: true,
      ),
      MasonryGridViewItemSection<CharacterEntity>(
        title: AppStrings.classicCharacters,
        items: const <CharacterEntity>[],
        onItemTap: (_) {},
        coverImageUrlGetter:
            (final CharacterEntity character) =>
                character.thumbnail?.fullUrl ?? "",
        isLoading: true,
      ),
      HorizontalListViewSection<CharacterEntity>(
        title: AppStrings.avengersCharacters,
        items: const <CharacterEntity>[],
        onItemTap: (_) {},
        coverImageUrlGetter:
            (final CharacterEntity character) =>
                character.thumbnail?.fullUrl ?? "",
        isLoading: true,
      ),
      MasonryGridViewItemSection<CharacterEntity>(
        title: AppStrings.spiderVerseCharacters,
        items: const <CharacterEntity>[],
        onItemTap: (_) {},
        coverImageUrlGetter:
            (final CharacterEntity character) =>
                character.thumbnail?.fullUrl ?? "",
        isLoading: true,
      ),
      HorizontalListViewSection<CharacterEntity>(
        title: AppStrings.xMenCharacters,
        items: const <CharacterEntity>[],
        onItemTap: (_) {},
        coverImageUrlGetter:
            (final CharacterEntity character) =>
                character.thumbnail?.fullUrl ?? "",
        isLoading: true,
      ),
    ],
  );
}
