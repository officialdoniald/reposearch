import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:reposearch/reposearch/domain/repositories/github_api_interface.dart';

class GithubApi implements GithubApiInterface {
  final http.Client client = http.Client();

  @override
  Future<List<RepoModelDTO>> searchRepos(String query) async {
    final uri = Uri.https(
      'api.github.com',
      '/search/repositories',
      {
        'q': query,
        'per_page': '30',
      },
    );

    final res = await client.get(uri, headers: {
      'Accept': 'application/vnd.github.v3+json',
    });

    if (res.statusCode == 200) {
      final jsonBody = json.decode(res.body) as Map<String, dynamic>;

      final items = jsonBody['items'] as List<dynamic>;

      return items
          .map((i) => RepoModelDTO.fromJson(i as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('GitHub API error: ${res.statusCode}');
    }
  }
}
