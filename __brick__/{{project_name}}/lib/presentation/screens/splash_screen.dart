import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/presentation/cubits/auth/auth_cubit.dart';
import 'package:{{project_name}}/presentation/route/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthAuthenticated) {
        context.goNamed(RouteNames.homeTab);
      } else if (state is AuthUnauthenticated) {
        context.goNamed(
          RouteNames.login,
        ); // Assuming 'login' route name exists, need to verify
      }
    },
    child: const Scaffold(body: Center(child: CircularProgressIndicator())),
  );
}
