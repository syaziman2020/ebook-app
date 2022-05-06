import 'package:ebook_app/cubit/auth_cubit.dart';
import 'package:ebook_app/ui/widgets/custom_button.dart';
import 'package:ebook_app/ui/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController ageController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passController = TextEditingController(text: "");
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 40,
        ),
        child: Text(
          "Find your favorite\nbook for free",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget nameField() {
      return CustomTextForm(
        title: "Name",
        hintText: "Your name",
        controller: nameController,
      );
    }

    Widget ageField() {
      return CustomTextForm(
        title: "Age",
        hintText: "Your age",
        controller: ageController,
      );
    }

    Widget emailField() {
      return CustomTextForm(
        title: "Email",
        hintText: "Your email",
        controller: emailController,
      );
    }

    Widget passwordField() {
      return CustomTextForm(
        title: "Password",
        hintText: "Your password",
        controller: passController,
        obscureText: true,
      );
    }

    Widget registerButton() {
      return Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/main',
                  (route) => false,
                );
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: greenC,
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomButton(
                text: "Register Now",
                onPressed: () {
                  context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        password: passController.text,
                        name: nameController.text,
                        age: int.tryParse(ageController.text),
                      );
                },
              );
            },
          ),
        ],
      );
    }

    Widget toLoginButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/login',
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 15, bottom: 30),
          child: Text(
            "Have an account? Login",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: creamC,
      body: ListView(
        padding: const EdgeInsets.only(
          top: 30,
          left: 30,
          right: 30,
        ),
        children: [
          title(),
          nameField(),
          ageField(),
          emailField(),
          passwordField(),
          registerButton(),
          toLoginButton()
        ],
      ),
    );
  }
}
