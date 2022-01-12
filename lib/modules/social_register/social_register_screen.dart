
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/social_register/cubit/cubit.dart';
import 'package:social_app/modules/social_register/cubit/states.dart';
import 'package:social_app/shared/components/components.dart';

class SocialRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state) {
          if (state is SocialRegisterSuccessState) {
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'login now to communicate with friends',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFromField(
                            label: 'User Name',
                            prefix: Icons.person,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                            controller: nameController,
                            type: TextInputType.name),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFromField(
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            controller: emailController,
                            type: TextInputType.emailAddress),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFromField(
                            label: 'Password',
                            prefix: Icons.lock_outline,
                            suffix: SocialRegisterCubit.get(context).iconPassword,
                            isPassword:
                                SocialRegisterCubit.get(context).isPassword,
                            onPressed: () {
                              SocialRegisterCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }
                            },
                            controller: passwordController,
                            type: TextInputType.visiblePassword),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFromField(
                            label: 'Phone Number',
                            prefix: Icons.phone,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your phone number';
                              }
                            },
                            controller: phoneController,
                            type: TextInputType.phone),
                        SizedBox(
                          height: 30.0,
                        ),
                        state is! SocialRegisterLoadingState
                            ? Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
//                                      SocialRegisterCubit.get(context)
//                                          .userRegister(
//                                        name: nameController.text,
//                                        phone: phoneController.text,
//                                        email: emailController.text,
//                                        password: passwordController.text,
//                                      );
                                    }
                                  },
                                  child: Text('REGISTER'),
                                  color: Colors.blue,
                                  height: 50,
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
