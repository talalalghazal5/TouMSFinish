import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Auth/logic/registerCubit/register_cubit.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/register/register_view_body.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return BlocProvider(
      create: (context) => RegisterCubit(ApiService()),
      child: SafeArea(
        child: Scaffold(
          body: RegisterViewBody(
            formKey: _formKey,
            width: width,
            height: height,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            emailController: emailController,
            phoneNumberController: phoneNumberController,
            userNameController: userNameController,
          ),
        ),
      ),
    );
  }
}
