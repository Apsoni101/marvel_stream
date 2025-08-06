import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/core/extensions/string_extensions.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/bright_cove_player.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/youtube_player.dart';

class MovieTrailerTab extends StatelessWidget {
  const MovieTrailerTab(this.trailerUrl, {super.key});

  final String? trailerUrl;

  @override
  Widget build(final BuildContext context) {
    if (trailerUrl.isNullOrEmpty) {
      return _noTrailerFallback(context);
    } else if (trailerUrl.isYouTubeUrl) {
      return YouTubePlayerWidget(url: trailerUrl!);
    } else if (trailerUrl.isBrightcoveUrl) {
      return BrightcovePlayer(url: trailerUrl!);
    } else {
      return _noTrailerFallback(context);
    }
  }

  Widget _noTrailerFallback(final BuildContext context) => AspectRatio(
    aspectRatio: 16 / 9,
    child: Center(
      child: Text(
        context.locale.trailerNA,
        style: TextStyle(fontSize: 16, color: context.appColors.white50),
      ),
    ),
  );
}
