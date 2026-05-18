import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Support/logic/SupportCubit/support_cubit.dart';
import 'package:wander_wise_app/features/Support/logic/SupportCubit/support_state.dart';
import 'package:wander_wise_app/features/Support/presentation/widgets/custom_faq_message.dart';

class FAQSupportView extends StatelessWidget {
  const FAQSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(ApiService())..getFaqSupports(),
      child: Scaffold(
        appBar: AppBar(title: const Text('FAQ'), centerTitle: true),
        body: BlocBuilder<SupportCubit, SupportState>(
          builder: (context, state) {
            if (state is SupportFailure) {
              return Center(child: Text(state.errorMessage));
            }
            if (state is SupportLoading) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: LoadingAnimationWidget.stretchedDots(
                    color: kprimaryColor3,
                    size: 40,
                  ),
                ),
              );
            }
            if (state is SupportSuccess) {
              final faqSupports = state.supports;
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: faqSupports.length,
                itemBuilder: (context, index) {
                  return CustomFAQMessage(faqSupports: faqSupports, index: index);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
