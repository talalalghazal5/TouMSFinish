import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Auth/logic/loginCubit/login_cubit.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/login/login_view_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return BlocProvider(
      create: (context) => LoginCubit(ApiService()),
      child: SafeArea(
        child: Scaffold(
          body: LoginViewBody(
            formKey: _formKey,
            width: width,
            height: height,
            passwordController: passwordController,
            emailController: emailController,
          ),
        ),
      ),
    );
  }
}
