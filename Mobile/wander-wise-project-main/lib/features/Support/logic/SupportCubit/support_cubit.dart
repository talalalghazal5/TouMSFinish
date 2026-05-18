import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Support/data/support_model.dart';
import 'package:wander_wise_app/features/Support/logic/SupportCubit/support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  final ApiService apiService;

  SupportCubit(this.apiService) : super(SupportInitial());

  Future<void> getFaqSupports() async {
    emit(SupportLoading());

    try {
      final response = await apiService.getFaqSupports();

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(SupportFailure(response['errormessage']));
        return;
      }
      final supports = (response as List)
          .map((item) => SupportModel.fromMap(item))
          .toList();
      emit(SupportSuccess(supports));
    } catch (e) {
      emit(SupportFailure('there is Unexpected error occurred'));
    }
  }
}