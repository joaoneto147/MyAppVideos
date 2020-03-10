// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$apiAtom = Atom(name: '_MovieControllerBase.api');

  @override
  MovieApi get api {
    _$apiAtom.context.enforceReadPolicy(_$apiAtom);
    _$apiAtom.reportObserved();
    return super.api;
  }

  @override
  set api(MovieApi value) {
    _$apiAtom.context.conditionallyRunInAction(() {
      super.api = value;
      _$apiAtom.reportChanged();
    }, _$apiAtom, name: '${_$apiAtom.name}_set');
  }

  final _$fetchMoviesRankedAsyncAction = AsyncAction('fetchMoviesRanked');

  @override
  Future fetchMoviesRanked() {
    return _$fetchMoviesRankedAsyncAction.run(() => super.fetchMoviesRanked());
  }

  final _$loadMoviesTrendingAsyncAction = AsyncAction('loadMoviesTrending');

  @override
  Future<MovieApi> loadMoviesTrending() {
    return _$loadMoviesTrendingAsyncAction
        .run(() => super.loadMoviesTrending());
  }

  final _$loadDetailMovieAsyncAction = AsyncAction('loadDetailMovie');

  @override
  Future<MovieApi> loadDetailMovie() {
    return _$loadDetailMovieAsyncAction.run(() => super.loadDetailMovie());
  }

  @override
  String toString() {
    final string = 'api: ${api.toString()}';
    return '{$string}';
  }
}
