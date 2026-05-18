import 'package:bloc/bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/core/network/endpoints.dart';
import 'package:wander_wise_app/features/Auth/data/login_model/login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiService apiService;
  LoginCubit(this.apiService) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await apiService.login({
        'email': email,
        'password': password,
      });

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(LoginFailure(response['errormessage']));
        return;
      }
      final loginModel = LoginModel.fromMap(response);
      if (loginModel.user!.role == 'user') {
        emit(LoginSuccess(loginModel));
        print(loginModel.token);
        Endpoints.token = loginModel.token!;
        Endpoints.userName = loginModel.user!.name!;
      } else {
        emit(LoginFailure('login failed try login with user account'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
