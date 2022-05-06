import 'package:ebook_app/cubit/auth_cubit.dart';
import 'package:ebook_app/cubit/current_page_cubit.dart';
import 'package:ebook_app/shared/theme.dart';
import 'package:ebook_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserContent extends StatelessWidget {
  const UserContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: greenC,
                    content: Text(state.error),
                  ),
                );
              } else if (state is AuthInitial) {
                context.read<CurrentPageCubit>().changePage(1);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
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
                text: "Log Out",
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
