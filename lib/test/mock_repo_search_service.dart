import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:reposearch/reposearch/domain/services/reposearch_service.dart';

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
