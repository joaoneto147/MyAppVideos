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

  final _$testeAtom = Atom(name: '_MovieControllerBase.teste');

  @override
  int get teste {
    _$testeAtom.context.enforceReadPolicy(_$testeAtom);
    _$testeAtom.reportObserved();
    return super.teste;
  }

  @override
  set teste(int value) {
    _$testeAtom.context.conditionallyRunInAction(() {
      super.teste = value;
      _$testeAtom.reportChanged();
    }, _$testeAtom, name: '${_$testeAtom.name}_set');
  }

  final _$_MovieControllerBaseActionController =
      ActionController(name: '_MovieControllerBase');

  @override
  dynamic fetchMoviesRanked() {
    final _$actionInfo = _$_MovieControllerBaseActionController.startAction();
    try {
      return super.fetchMoviesRanked();
    } finally {
      _$_MovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'api: ${api.toString()},teste: ${teste.toString()}';
    return '{$string}';
  }
}
