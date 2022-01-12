
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/social_register/cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);
//  void userRegister({
//    required String email,
//    required String name,
//    required String phone,
//    required String password,
//  }) {
//    emit(SocialRegisterLoadingState());
//    DioHelper.PostData(
//      url: REGISTER,
//      data: {
//        'email': email,
//        'name': name,
//        'phone': phone,
//        'password': password,
//      },
//    ).then(
//      (value) {
//        loginModel = SocialLoginModel.fromJson(value.data);
//        print(value.data);
//        emit(SocialRegisterSuccessState(loginModel));
//      },
//    ).catchError((error) {
//      print(error);
//      emit(SocialRegisterErrorState(error.toString()));
//    });
//  }

  IconData iconPassword = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    iconPassword =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterShowOrHidePasswordState());
  }
}
