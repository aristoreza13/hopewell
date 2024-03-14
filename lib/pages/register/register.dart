import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hopewell/common/values/app_colors.dart';
import 'package:hopewell/pages/register/bloc/register_bloc.dart';
import 'package:hopewell/pages/register/register_controller.dart';
import 'package:hopewell/pages/sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: AppColors.mojito,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.mojito,
              appBar: buildAppBar("register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: reusableText(
                            "Enter your details below & free sign up")),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Username"),
                          buildTextField(
                            "Enter your username",
                            "email",
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(UsernameEvent(value));
                            },
                          ),
                          reusableText("Email"),
                          buildTextField(
                            "Enter your email address",
                            "email",
                            "user",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reusableText("Password"),
                          buildTextField(
                            "Enter your password",
                            "password",
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reusableText("Confirm Password"),
                          buildTextField(
                            "Re-enter your password",
                            "password",
                            "lock",
                            (value) {
                              context
                                  .read<RegisterBloc>()
                                  .add(ConfirmEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                          "By creating an account you have to agree with our terms & condition."),
                    ),
                    buildLoginRegisterButton("Register", 'login', () {
                      // Navigator.of(context).pushNamed("register");
                      RegisterController(context: context)
                          .handleEmailRegister();
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
