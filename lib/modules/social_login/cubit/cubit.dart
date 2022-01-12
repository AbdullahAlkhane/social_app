import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/social_login/cubit/states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

//  void userLogin({
//    required String email,
//    required String password,
//  }) {
//    emit(SocialLoginLoadingState());
//    DioHelper.PostData(
//      url: LOGIN,
//      data: {
//        'email': email,
//        'password': password,
//      },
//    ).then(
//      (value) {
//
//        emit(SocialLoginSuccessState());
//      },
//    ).catchError((error) {
//      print(error);
//      emit(SocialLoginErrorState(error.toString()));
//    });
//  }

  IconData iconPassword = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    iconPassword =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialShowOrHidePasswordState());
  }
}
