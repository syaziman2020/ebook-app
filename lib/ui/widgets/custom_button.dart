import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15),
            ),
            backgroundColor: MaterialStateProperty.all(
              greenC,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
