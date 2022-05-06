import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextForm extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const CustomTextForm({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: greenC,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                borderSide: BorderSide(color: greyC),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                borderSide: BorderSide(color: greenC),
              ),
            ),
          )
        ],
      ),
    );
  }
}
