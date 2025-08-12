import 'package:flutter/material.dart';
import 'package:reposearch/reposearch/data/models/dto/repo_model_dto.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoTile extends StatelessWidget {
  final RepoModelDTO repo;
  const RepoTile({super.key, required this.repo});

  openUrl() async {
    if (!await launchUrl(Uri.parse(repo.htmlUrl),
        mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch ${repo.htmlUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: repo.avatarUrl.isNotEmpty
          ? CircleAvatar(backgroundImage: NetworkImage(repo.avatarUrl))
          : const Icon(Icons.no_accounts),
      title: Text(repo.fullName),
      subtitle:
          Text(repo.description.isNotEmpty ? repo.description : repo.name),
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(repo.fullName),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: repo.avatarUrl.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(repo.avatarUrl))
                          : const Icon(Icons.no_accounts),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(repo.description),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: openUrl,
                      child: Text('URL: ' + repo.htmlUrl),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Forks: ${repo.forksCount}',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Created: ${repo.createdAt}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Updated: ${repo.updatedAt}'),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'))
                ],
              );
            });
      },
    );
  }
}
