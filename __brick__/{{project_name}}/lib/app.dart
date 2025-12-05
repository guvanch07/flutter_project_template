import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/domain/repositories/auth_repository.dart';
import 'package:{{project_name}}/injection.dart';
import 'package:{{project_name}}/presentation/cubits/auth/auth_cubit.dart';
import 'package:{{project_name}}/presentation/route/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(authRepository: getIt<AuthRepository>()),
        ),
      ],
      child: MaterialApp.router(
        title: '{{project_name.titleCase()}}',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
