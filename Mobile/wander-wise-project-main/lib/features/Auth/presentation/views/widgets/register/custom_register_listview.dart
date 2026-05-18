import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Auth/logic/registerCubit/register_cubit.dart';
import 'package:wander_wise_app/features/Auth/logic/registerCubit/register_state.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/custom_auth_field.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/custom_auth_row.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class CustomRegisterListview extends StatelessWidget {
  const CustomRegisterListview({
    super.key,
    required this.height,
    required this.passwordController,
    required this.confirmPasswordController,
    required GlobalKey<FormState> formKey,
    required this.width,
    required this.emailController,
    required this.userNameController,
  }) : _formKey = formKey;

  final double height;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final GlobalKey<FormState> _formKey;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          final user = state.registerModel.user;

          print("✅ registered as ${user?.name}");
          GoRouter.of(context).push(AppRouter.kLoginView);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: kprimaryColor1,
              content: Text(
                state.registerModel.message!,
                style: textStyleSize15,
              ),
            ),
          );
          Future.delayed(Duration(seconds: 2));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: kprimaryColor1,
              content: Text("you can Login now", style: textStyleSize15),
            ),
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: kprimaryColor1,
              content: Text(state.errorMessage, style: textStyleSize15),
            ),
          );
        }
      },
      builder: (context, state) {
        return ListView(
          key: const PageStorageKey('registerList'),
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: height * 0.03),
          children: [
            CustomAuthField(
              hinttext: 'Enter your user name',
              isEditing: true,
              controller: userNameController,
              labeltext: 'User Name',
              isPassword: false,
              prefixIcon: const Icon(Icons.person),
            ),
            SizedBox(height: height * 0.03),
            CustomAuthField(
              hinttext: 'Enter your Email Address',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              prefixIcon: const Icon(Icons.email),
              isEditing: true,
              labeltext: 'Email address',
              isPassword: false,
            ),
            SizedBox(height: height * 0.03),
            CustomAuthField(
              hinttext: 'Enter your password',
              prefixIcon: const Icon(Icons.lock),
              isEditing: true,
              controller: passwordController,
              labeltext: 'Password',
              isPassword: true,
            ),
            SizedBox(height: height * 0.03),
            CustomAuthField(
              hinttext: 'Enter password confirmation',
              prefixIcon: const Icon(Icons.lock),
              isEditing: true,
              controller: confirmPasswordController,
              confirmPasswordAgainst: passwordController,
              labeltext: 'Password Confirmation',
              isPassword: true,
            ),
            SizedBox(height: height * 0.05),
            if (state is RegisterLoading)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: kprimaryColor3,
                    size: 40,
                  ),
                ),
              )
            else
              CustomBottom(
                title: 'Register',
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegisterCubit>().register(
                      userName: userNameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      passwordConfirmation: confirmPasswordController.text
                          .trim(),
                    );
                  }
                },
              ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.09),
              child: CustomAuthRow(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kLoginView,
                    extra: {userNameController, emailController},
                  );
                },
                firstTitle: 'Already have an account ?',
                secondTitle: 'Login',
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
      },
    );
  }
}
