import 'package:cinema_pedia/presentation/providers/providers.dart';
import 'package:cinema_pedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvideer);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideShow = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          MoviesSlideShow(
            movies: moviesSlideShow,
          ),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cartelera',
            subtitle: 'Lunes',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Proximamente',
            subtitle: 'Este mes',
            loadNextPage: () =>
                ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populares',
            // subtitle: 'Lunes',
            loadNextPage: () =>
                ref.read(popularMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Mejor calificada',
            subtitle: 'Todos los tiempos',
            loadNextPage: () =>
                ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
          ),
          const SizedBox(
            height: 25,
          )
        ]);
      }, childCount: 1)),
    ]);
  }
}
