import 'package:flutter/material.dart';
import 'package:folkloria/data/services/api_service.dart';
import 'package:folkloria/data/services/local_database_service.dart';
import 'package:folkloria/providers/detail/book_detail_provider.dart';
import 'package:folkloria/providers/favorite/local_database_provider.dart';
import 'package:folkloria/providers/home/book_list_provider.dart';
import 'package:folkloria/providers/main/index_nav_provider.dart';
import 'package:folkloria/ui/screens/detail/detail_screen.dart';
import 'package:folkloria/ui/screens/main/main_screen.dart';
import 'package:folkloria/common/static/navigation_route.dart';
import 'package:folkloria/common/style/theme/folkloria_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:folkloria/providers/setting/dark_mode_state_provider.dart';
import 'package:folkloria/providers/setting/shared_preferences_provider.dart';
import 'package:folkloria/data/services/shared_preferences_service.dart';
import 'package:folkloria/common/utils/dark_mode_state.dart' as dms;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  String route = NavigationRoute.mainRoute.name;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) => BookListProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) => BookDetailProvider(context.read<ApiServices>()),
        ),
        Provider(create: (context) => LocalDatabaseService()),
        ChangeNotifierProvider(
          create: (context) =>
              LocalDatabaseProvider(context.read<LocalDatabaseService>()),
        ),
        ChangeNotifierProvider(create: (context) => DarkModeStateProvider()),
        Provider(create: (context) => SharedPreferencesService(prefs)),
        ChangeNotifierProvider(
          create: (context) => SharedPreferencesProvider(
            context.read<SharedPreferencesService>(),
          ),
        ),
      ],
      child: MyApp(initialRoute: route),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeStateProvider>(
      builder: (context, darkModeStateProvider, child) {
        return MaterialApp(
          title: 'Book App',
          debugShowCheckedModeBanner: false,
          theme: FolkloriaTheme.lightTheme,
          darkTheme: FolkloriaTheme.darkTheme,
          themeMode: darkModeStateProvider.darkModeState.isEnable
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: widget.initialRoute,
          routes: {
            NavigationRoute.mainRoute.name: (context) => const MainScreen(),
            NavigationRoute.detailRoute.name: (context) => DetailScreen(
              bookId: ModalRoute.of(context)?.settings.arguments as String,
            ),
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    final darkModeStateProvider = context.read<DarkModeStateProvider>();
    final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    Future.microtask(() async {
      sharedPreferencesProvider.getDarkModeValue();
      final darkMode = sharedPreferencesProvider.darkMode;

      if (darkMode != null) {
        darkModeStateProvider.darkModeState = dms.BoolExtension(
          darkMode.darkModeEnable,
        ).isEnable;
      }
    });
  }
}
