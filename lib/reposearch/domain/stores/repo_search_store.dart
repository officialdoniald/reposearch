import 'package:mobx/mobx.dart';
import 'package:reposearch/main.dart';
import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:reposearch/reposearch/domain/services/reposearch_service.dart';

part 'repo_search_store.g.dart';

class RepoSearchStore = RepoSearchStoreClass with _$RepoSearchStore;

abstract class RepoSearchStoreClass with Store {
  @observable
  ObservableList<RepoModelDTO> repos = ObservableList<RepoModelDTO>();

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  Future<void> search(String query) async {
    loading = true;

    error = null;

    try {
      final res = await getIt<RepoSearchService>().searchAndCache(query);

      repos = ObservableList.of(res);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> loadCache() async {
    loading = true;

    error = null;

    try {
      final res = await getIt<RepoSearchService>().loadCached();
      repos = ObservableList.of(res);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
    }
  }
}
