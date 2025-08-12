import 'package:reposearch/main.dart';
import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:reposearch/reposearch/domain/repositories/github_api_interface.dart';

class RepoSearchService {
  Future<List<RepoModelDTO>> searchAndCache(String query) async {
    if (query.isNotEmpty) {
      final remoteRes = await getIt<GithubApiInterface>().searchRepos(query);
      await repoDB.clearRepos();
      await repoDB.insertRepos(remoteRes);

      return remoteRes;
    } else {
      return await loadCached();
    }
  }

  Future<List<RepoModelDTO>> loadCached() async {
    return await repoDB.getAllRepos();
  }
}
