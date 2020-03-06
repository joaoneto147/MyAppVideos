// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilmeController on _FilmeControllerBase, Store {
  final _$listFilmeAtom = Atom(name: '_FilmeControllerBase.listFilme');

  @override
  ObservableList<Movie> get listFilme {
    _$listFilmeAtom.context.enforceReadPolicy(_$listFilmeAtom);
    _$listFilmeAtom.reportObserved();
    return super.listFilme;
  }

  @override
  set listFilme(ObservableList<Movie> value) {
    _$listFilmeAtom.context.conditionallyRunInAction(() {
      super.listFilme = value;
      _$listFilmeAtom.reportChanged();
    }, _$listFilmeAtom, name: '${_$listFilmeAtom.name}_set');
  }

  final _$ratingAtom = Atom(name: '_FilmeControllerBase.rating');

  @override
  int get rating {
    _$ratingAtom.context.enforceReadPolicy(_$ratingAtom);
    _$ratingAtom.reportObserved();
    return super.rating;
  }

  @override
  set rating(int value) {
    _$ratingAtom.context.conditionallyRunInAction(() {
      super.rating = value;
      _$ratingAtom.reportChanged();
    }, _$ratingAtom, name: '${_$ratingAtom.name}_set');
  }

  final _$loadPostsAsyncAction = AsyncAction('loadPosts');

  @override
  Future loadPosts() {
    return _$loadPostsAsyncAction.run(() => super.loadPosts());
  }

  final _$_FilmeControllerBaseActionController =
      ActionController(name: '_FilmeControllerBase');

  @override
  dynamic setRating(int value) {
    final _$actionInfo = _$_FilmeControllerBaseActionController.startAction();
    try {
      return super.setRating(value);
    } finally {
      _$_FilmeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'listFilme: ${listFilme.toString()},rating: ${rating.toString()}';
    return '{$string}';
  }
}
