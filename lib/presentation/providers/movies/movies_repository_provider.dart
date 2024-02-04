import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinema_pedia/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinema_pedia/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDatasource());
});
