import 'package:ebook_app/cubit/auth_cubit.dart';
import 'package:ebook_app/shared/theme.dart';
import 'package:ebook_app/ui/widgets/custom_button.dart';
import 'package:ebook_app/ui/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passController = TextEditingController(text: "");
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 60),
        child: Text(
          "Sign In with your\nexisting account",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget registerButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/register',
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 15, bottom: 30),
          child: Text(
            "Don't have an account? Register now",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    Widget emailField() {
      return CustomTextForm(
        title: "Email Address",
        hintText: "Your email address",
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

    Widget loginButton() {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (_, state) {
              print(state);
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
                text: "Login",
                onPressed: () {
                  context.read<AuthCubit>().logIn(
                        email: emailController.text,
                        password: passController.text,
                      );
                },
              );
            },
          ),
        ],
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
          emailField(),
          passwordField(),
          loginButton(),
          registerButton(),
        ],
      ),
    );
  }
}
