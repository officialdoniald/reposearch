import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';

abstract class GithubApiInterface {
  Future<List<RepoModelDTO>> searchRepos(String query);
}
