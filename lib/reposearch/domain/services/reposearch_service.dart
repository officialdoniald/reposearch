import 'package:reposearch/main.dart';
import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:reposearch/reposearch/domain/repositories/github_api_interface.dart';

class ReposearchService {
  Future<List<RepoModelDTO>> searchRepos(String query) async {
    return await getIt<GithubApiInterface>().searchRepos(query);
  }
}
