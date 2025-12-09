// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/presentation/cubits/auth/auth_cubit.dart';
import 'package:{{project_name}}/presentation/route/route_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthAuthenticated) {
        context.goNamed(RouteNames.homeTab);
      } else if (state is AuthUnauthenticated) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login Failed')));
      }
    },
    child: Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthCubit>().signIn('test@example.com', 'password');
          },
          child: const Text('Sign In'),
        ),
      ),
    ),
  );
}
