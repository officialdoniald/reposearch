import 'package:flutter/material.dart';
import 'package:reposearch/language_constants.dart';
import 'package:reposearch/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reposearch/reposearch/domain/stores/repo_search_store.dart';
import 'package:reposearch/reposearch/presentation/widgets/repo_tile_widget.dart';
import 'package:reposearch/theme/theme_store.dart';

class SearchRepoScreen extends StatefulWidget {
  const SearchRepoScreen({super.key});

  @override
  State<SearchRepoScreen> createState() => _SearchRepoScreenState();
}

class _SearchRepoScreenState extends State<SearchRepoScreen> {
  final TextEditingController ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    getIt<RepoSearchStore>().loadCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, "search_repo_screen_title")),
        actions: [
          Observer(
            builder: (_) => IconButton(
              icon: Icon(
                getIt<ThemeStore>().themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: getIt<ThemeStore>().toggleTheme,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Row(children: [
            Expanded(
              child: TextField(
                controller: ctrl,
                decoration: InputDecoration(
                    hintText:
                        getTranslated(context, "search_repo_screen_search")),
                onSubmitted: (v) => getIt<RepoSearchStore>().search(v),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => getIt<RepoSearchStore>().search(ctrl.text),
              child: Text(
                  getTranslated(context, "search_repo_screen_search_button")),
            )
          ]),
          const SizedBox(height: 12),
          Expanded(
            child: Observer(builder: (_) {
              if (getIt<RepoSearchStore>().loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (getIt<RepoSearchStore>().error != null) {
                return Center(
                    child: Text('Error: ${getIt<RepoSearchStore>().error}'));
              }
              if (getIt<RepoSearchStore>().repos.isEmpty) {
                return Center(
                    child: Text(getTranslated(
                        context, "search_repo_screen_no_result")));
              }
              return ListView.builder(
                itemCount: getIt<RepoSearchStore>().repos.length,
                itemBuilder: (context, i) {
                  final r = getIt<RepoSearchStore>().repos[i];
                  return RepoTile(repo: r);
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}
