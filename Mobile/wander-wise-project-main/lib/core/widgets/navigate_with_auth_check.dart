import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Auth/logic/AuthCubit/auth_cubit.dart';
import 'package:wander_wise_app/features/Auth/logic/AuthCubit/auth_state.dart';
import 'package:wander_wise_app/routes/app_router.dart';

void navigateWithAuthCheck(BuildContext context, String route) {
  final authStatus = context.read<AuthCubit>().state.status;

  if (authStatus == AuthStatus.guest) {
    _showLoginAlert(context);
  } else {
    context.push(route);
  }
}

void _showLoginAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Login Required',style: textStyleSize20.copyWith(color: Colors.deepOrangeAccent)),
      content: Text('Please log in to use this feature',style: textStyleSize15),
      actions: [
        TextButton(
          onPressed: () {GoRouter.of(context).pop(context);},
          child: Text('Cancel',style: textStyleSize15,),
        ),
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
            GoRouter.of(context).push(AppRouter.kLoginView);
          },
          child: Text('Login Now',style: textStyleSize15),
        ),
      ],
    ),
  );
}
