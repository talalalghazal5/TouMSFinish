import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Auth/logic/loginCubit/login_cubit.dart';
import 'package:wander_wise_app/features/Auth/logic/loginCubit/login_state.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/custom_auth_field.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/custom_auth_row.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class CustomLoginListview extends StatelessWidget {
  const CustomLoginListview({
    super.key,
    required this.height,
    required this.passwordController,
    required this.emailController,
    required GlobalKey<FormState> formKey,
    required this.width,
  }) : _formKey = formKey;

  final double height;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  final GlobalKey<FormState> _formKey;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomAuthField(
          controller: emailController,
          prefixIcon: Icon(Icons.email),
          hinttext: 'Enter your Email address',
          isEditing: true,
          labeltext: 'Email address',
          isPassword: false,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: height * 0.03),
        CustomAuthField(
          prefixIcon: Icon(Icons.lock),
          hinttext: 'Enter your Password',
          isEditing: true,
          controller: passwordController,
          labeltext: 'Password',
          isPassword: true,
        ),
        SizedBox(height: height * 0.05),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              final user = state.loginModel.user;
              final token = state.loginModel.token;

              print("✅ Logged in as ${user?.name}, token: $token");
              Future.delayed(const Duration(seconds: 1), () {
                GoRouter.of(context).push(AppRouter.kHomeScreen);
              });
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: Duration(milliseconds: 50),
                  backgroundColor: kprimaryColor1,
                  content: Text(state.errorMessage, style: textStyleSize15),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: kprimaryColor3,
                    size: 40,
                  ),
                ),
              );
            }
            return CustomBottom(
              title: 'Login',
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginCubit>().login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                }
              },
            );
          },
        ),
        SizedBox(height: height * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.09),
          child: CustomAuthRow(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kRegisterView);
            },
            firstTitle: 'Dont have an Account?',
            secondTitle: 'Register',
          ),
        ),
        SizedBox(height: height * 0.03),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: width * 0.09),
        //   child: Center(
        //     child: GestureDetector(
        //       onTap: () {
        //         context.read<AuthCubit>().continueAsGuest();
        //         GoRouter.of(context).push(AppRouter.kFirstAnimationView);
        //       },
        //       child: Text(
        //         'Continue as a guest >>>',
        //         style: textStyleSize20.copyWith(color: kprimaryColor6),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
