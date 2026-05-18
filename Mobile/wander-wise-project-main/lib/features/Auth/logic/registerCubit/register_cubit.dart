import 'package:bloc/bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Auth/data/register_model/register_model.dart';
import 'package:wander_wise_app/features/Auth/logic/registerCubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ApiService apiService;
  RegisterCubit(this.apiService) : super(RegisterInitial());

  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoading());

    try {
      final response = await apiService.register({
        'name': userName,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'role': 'user',
      });
      print('Response type: ${response.runtimeType}');
      // print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(RegisterFailure(response['errormessage']));
        return;
      }
      final registerModel = RegisterModel.fromMap(response);
      emit(RegisterSuccess(registerModel));
    } catch (e) {
      emit(RegisterFailure('there is Unexpected error occurred'));
    }
  }
}
