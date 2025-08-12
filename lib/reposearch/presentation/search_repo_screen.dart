import 'package:flutter/material.dart';
import 'package:reposearch/main.dart';
import 'package:reposearch/reposearch/domain/stores/repo_search_store.dart';

class SearchRepoScreen extends StatefulWidget {
  const SearchRepoScreen({super.key});

  @override
  State<SearchRepoScreen> createState() => _SearchRepoScreenState();
}

class _SearchRepoScreenState extends State<SearchRepoScreen> {
  @override
  void initState() {
    super.initState();
    getIt<RepoSearchStore>().loadCache();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
