import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:reposearch/app_localizations.dart';
import 'package:reposearch/reposearch/data/datasources/local/repo_db.dart';
import 'package:reposearch/reposearch/data/repositories/github_api.dart';
import 'package:reposearch/reposearch/domain/repositories/github_api_interface.dart';
import 'package:reposearch/reposearch/domain/services/reposearch_service.dart';
import 'package:reposearch/reposearch/domain/stores/repo_search_store.dart';
import 'package:reposearch/reposearch/presentation/search_repo_screen.dart';
import 'package:reposearch/theme/theme_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:reposearch/test/mock_repo_search_service.dart';
//import 'package:flutter_test/flutter_test.dart';

GetIt getIt = GetIt.instance;
late RepoDB repoDB;

void _setupServices() {
  getIt.registerSingleton<ThemeStore>(ThemeStore());
  getIt.registerSingleton<GithubApiInterface>(GithubApi());
  getIt.registerSingleton<RepoSearchService>(RepoSearchService());
  getIt.registerSingleton<RepoSearchStore>(RepoSearchStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  repoDB = await RepoDB.instance.init();

  _setupServices();

  runApp(const MyApp());

  /*late RepoSearchStore store;
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
  });*/
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    var prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', newLocale.languageCode);
    prefs.setString('countryCode', "");

    // ignore: invalid_use_of_protected_member
    state?.setState(() {
      state._locale = newLocale;
    });
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale("hu", "HU");

  @override
  void initState() {
    super.initState();
    _fetchLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  Future<Locale> _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    String languageCode = prefs.getString('languageCode') ?? 'hu';
    String countryCode = prefs.getString('countryCode') ?? 'HU';

    return Locale(languageCode, countryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Flutter Demo',
        supportedLocales: const [
          Locale("en", "US"),
          Locale("hu", "HU"),
        ],
        locale: _locale,
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: getIt<ThemeStore>().themeMode,
        home: const SearchRepoScreen(),
      ),
    );
  }
}
