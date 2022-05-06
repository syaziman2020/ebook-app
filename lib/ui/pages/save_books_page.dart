import 'package:ebook_app/shared/theme.dart';
import 'package:flutter/material.dart';

class SaveBooks extends StatelessWidget {
  const SaveBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Save Books Page',
        style: blackTextStyle.copyWith(
          fontSize: 20,
          fontWeight: medium,
        ),
      ),
    );
  }
}
