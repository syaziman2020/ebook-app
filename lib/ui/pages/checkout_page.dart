import 'package:ebook_app/shared/theme.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Chekout Page",
        style: blackTextStyle.copyWith(
          fontSize: 20,
          fontWeight: medium,
        ),
      ),
    );
  }
}
