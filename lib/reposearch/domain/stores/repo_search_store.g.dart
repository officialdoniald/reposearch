// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RepoSearchStore on RepoSearchStoreClass, Store {
  late final _$reposAtom =
      Atom(name: 'RepoSearchStoreClass.repos', context: context);

  @override
  ObservableList<RepoModelDTO> get repos {
    _$reposAtom.reportRead();
    return super.repos;
  }

  @override
  set repos(ObservableList<RepoModelDTO> value) {
    _$reposAtom.reportWrite(value, super.repos, () {
      super.repos = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'RepoSearchStoreClass.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'RepoSearchStoreClass.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$searchAsyncAction =
      AsyncAction('RepoSearchStoreClass.search', context: context);

  @override
  Future<void> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  late final _$loadCacheAsyncAction =
      AsyncAction('RepoSearchStoreClass.loadCache', context: context);

  @override
  Future<void> loadCache() {
    return _$loadCacheAsyncAction.run(() => super.loadCache());
  }

  @override
  String toString() {
    return '''
repos: ${repos},
loading: ${loading},
error: ${error}
    ''';
  }
}
