import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/feature/news/domain/entities/news_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/thumbnail_entity.dart';
import 'package:marvel_stream/feature/news/presentation/bloc/news_bloc.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<NewsBloc>().add(const LoadMoreNewsEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onRefresh() {
    context.read<NewsBloc>().add(const RefreshNewsEvent());
  }

  @override
  Widget build(final BuildContext context) => BlocProvider<NewsBloc>(
    create: (_) => AppInjector.getIt<NewsBloc>()..add(const LoadNewsEvent()),
    child: Scaffold(
      appBar: AppBar(title: const Text('Latest News')),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (final BuildContext context, final NewsState state) {
          if (state is NewsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (final BuildContext context, final NewsState state) {
          if (state is NewsInitial || state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NewsError && (state.news?.isEmpty ?? true)) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        () =>
                            context.read<NewsBloc>().add(const LoadNewsEvent()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final List<NewsEntity> news =
              state is NewsLoaded
                  ? state.news
                  : state is NewsLoadingMore
                  ? state.currentNews
                  : state is NewsError
                  ? state.news ?? <NewsEntity>[]
                  : <NewsEntity>[];

          final bool isLoadingMore = state is NewsLoadingMore;
          final bool hasMore = state is NewsLoaded && state.hasMore ;

          return RefreshIndicator(
            onRefresh: () async => _onRefresh(),
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: news.length + (hasMore ? 1 : 0),
              itemBuilder: (final BuildContext context, final int index) {
                if (index >= news.length) {
                  return Center(
                    child:
                        isLoadingMore
                            ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: CircularProgressIndicator(),
                            )
                            : const SizedBox.shrink(),
                  );
                }
                return NewsItem(news: news[index]);
              },
            ),
          );
        },
      ),
    ),
  );
}

class NewsItem extends StatelessWidget {
  final NewsEntity news;

  const NewsItem({super.key, required this.news});

  String? _getImageUrl(final ThumbnailEntity? thumbnail) {
    if (thumbnail?.path == null || thumbnail?.extension == null) return null;
    return '${thumbnail!.path}.${thumbnail.extension}';
  }

  @override
  Widget build(final BuildContext context) {
    final String? imageUrl = _getImageUrl(news.thumbnail);

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (final BuildContext context, final Object error, final StackTrace? stackTrace) =>
                          Container(
                            height: 200,
                            color: Colors.grey[200],
                            child: const Icon(Icons.broken_image),
                          ),
                  loadingBuilder: (
                    final BuildContext context,
                    final Widget child,
                    final ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: Colors.grey[200],
                      child: Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            Text(news.description ?? ''),
            const SizedBox(height: 8),
            if (news.modified != null)
              Text(
                'Published: ${news.start}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
