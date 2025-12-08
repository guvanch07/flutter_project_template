import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:slang_flutter/slang_flutter.dart';
import 'package:{{project_name}}/domain/repositories/repositories.dart';
import 'package:{{project_name}}/domain/utils/utils.dart';
import 'package:{{project_name}}/i18n/strings.g.dart';
import 'package:{{project_name}}/injection.dart';
import 'package:{{project_name}}/presentation/cubits/cubits.dart';
import 'package:{{project_name}}/presentation/route/route.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  // CustomThemeData get _theme => getIt<CommonUiData>().theme; // TODO: Implement CommonUiData

  @override
  void initState() {
    /*
    if (!kIsWeb && Platform.isIOS) {
      WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
        // PermissionsUtil.requestAppTracking(); // TODO: Implement PermissionsUtil
      });
    }
    */
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _handleIncomingLinks();
    _handleInitialDeepLink();
    _resetAppBadgeIfSupported();
  }

  void _handleIncomingLinks() {
    AppLinks().uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          DeeplinkHandler.fromUri(uri);
        }
      },
      onError: (err) {
        debugPrint('Error receiving incoming link: $err');
      },
    );
  }

  /// call on initState func only if app doesn't have auth
  Future<void> _handleInitialDeepLink() async {
    final uri = await AppLinks().getInitialLink();
    if (uri != null) {
      DeeplinkHandler.fromUri(uri);
    }
  }

  /// Reset app icon badge if supported
  Future<void> _resetAppBadgeIfSupported() async {
    try {
      if (!kIsWeb && await AppBadgePlus.isSupported()) {
        await AppBadgePlus.updateBadge(0);
      }
    } catch (_) {}
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _resetAppBadgeIfSupported();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthCubit(authRepository: getIt<AuthRepository>()),
      ),
      BlocProvider(
        create: (_) =>
            ThemeCubit(preferencesRepository: getIt<PreferencesRepository>()),
      ),
    ],
    child: MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              _onLogIn(context);
            }
          },
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp.router(
          title: '{{project_name.titleCase()}}',
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1)),
            child: child!,
          ),
          routerConfig: router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeMode,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // RefreshLocalizations.delegate,
          ],
        ),
      ),
    ),
  );

  void _onLogIn(BuildContext context) {
    // Navigation.toHome();
    // context.read<SubscriptionCubit>().getStatus();
    // context.read<CardSearchHistoryCubit>().loadHistory();
    // todo: init blocs here
  }
}
