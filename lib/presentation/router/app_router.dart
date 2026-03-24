import 'package:authors/presentation/home/authors_screen.dart';
import 'package:authors/presentation/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

const authorsPath = '/authors';
const settingsPath = '/settings';

class AppRouter {
  GoRouter config() {
    return GoRouter(
      initialLocation: authorsPath,
      routes: <RouteBase>[
        GoRoute(
          path: authorsPath,
          builder: (context, state) => const AuthorsScreen(),
        ),
        GoRoute(
          path: settingsPath,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    );
  }
}
