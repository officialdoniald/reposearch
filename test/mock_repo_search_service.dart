import 'package:reposearch/reposearch/domain/services/reposearch_service.dart';
import 'package:reposearch/reposearch/domain/stores/repo_search_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reposearch/main.dart';
import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';

class MockRepoSearchService implements RepoSearchService {
  bool searchCalled = false;
  bool loadCacheCalled = false;
  bool throwOnSearch = false;
  bool throwOnLoadCache = false;

  @override
  Future<List<RepoModelDTO>> searchAndCache(String query) async {
    searchCalled = true;
    if (throwOnSearch) throw Exception('Search failed');
    return [
      RepoModelDTO(
        id: 1,
        name: 'Test Repo',
        fullName: 'user/test-repo',
        description: 'A test repo',
        htmlUrl: 'https://github.com/user/test-repo',
        avatarUrl: 'https://example.com/avatar.png',
        createdAt: '2023-01-01T00:00:00Z',
        updatedAt: '2023-01-02T00:00:00Z',
        forksCount: 5,
      )
    ];
  }

  @override
  Future<List<RepoModelDTO>> loadCached() async {
    loadCacheCalled = true;
    if (throwOnLoadCache) throw Exception('Cache load failed');
    return [
      RepoModelDTO(
        id: 2,
        name: 'Cached Repo',
        fullName: 'user/cached-repo',
        description: 'A cached repo',
        htmlUrl: 'https://github.com/user/cached-repo',
        avatarUrl: 'https://example.com/avatar2.png',
        createdAt: '2023-02-01T00:00:00Z',
        updatedAt: '2023-02-02T00:00:00Z',
        forksCount: 10,
      )
    ];
  }
}

void main() {
  late RepoSearchStore store;
  late MockRepoSearchService mockService;

  setUp(() {
    mockService = MockRepoSearchService();
    getIt.unregister<RepoSearchService>();
    getIt.registerSingleton<RepoSearchService>(mockService);
    store = RepoSearchStore();
  });

  test('search() calls service and updates repos', () async {
    await store.search('flutter');

    expect(mockService.searchCalled, true);
    expect(store.repos.length, 1);
    expect(store.repos.first.name, 'Test Repo');
    expect(store.loading, false);
    expect(store.error, isNull);
  });

  test('loadCache() calls service and updates repos', () async {
    await store.loadCache();

    expect(mockService.loadCacheCalled, true);
    expect(store.repos.length, 1);
    expect(store.repos.first.name, 'Cached Repo');
    expect(store.loading, false);
    expect(store.error, isNull);
  });

  test('search() sets error when service throws', () async {
    mockService.throwOnSearch = true;

    await store.search('flutter');

    expect(store.repos.isEmpty, true);
    expect(store.loading, false);
    expect(store.error, contains('Search failed'));
  });

  test('loadCache() sets error when service throws', () async {
    mockService.throwOnLoadCache = true;

    await store.loadCache();

    expect(store.repos.isEmpty, true);
    expect(store.loading, false);
    expect(store.error, contains('Cache load failed'));
  });
}
