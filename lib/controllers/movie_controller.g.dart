// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  final _$moviesAtom = Atom(name: '_MovieControllerBase.movies');

  @override
  List<Movie> get movies {
    _$moviesAtom.context.enforceReadPolicy(_$moviesAtom);
    _$moviesAtom.reportObserved();
    return super.movies;
  }

  @override
  set movies(List<Movie> value) {
    _$moviesAtom.context.conditionallyRunInAction(() {
      super.movies = value;
      _$moviesAtom.reportChanged();
    }, _$moviesAtom, name: '${_$moviesAtom.name}_set');
  }

  final _$getMoviesRankedAsyncAction = AsyncAction('getMoviesRanked');

  @override
  Future getMoviesRanked(int page) {
    return _$getMoviesRankedAsyncAction.run(() => super.getMoviesRanked(page));
  }

  @override
  String toString() {
    final string = 'movies: ${movies.toString()}';
    return '{$string}';
  }
}
