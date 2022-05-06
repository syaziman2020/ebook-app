import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ItemRate extends StatelessWidget {
  final String name;
  final String value;
  const ItemRate({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: greyTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 10,
            color: const Color(0xff6B6B6B),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(value),
      ],
    );
  }
}
