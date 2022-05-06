import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ListBook extends StatelessWidget {
  final bool selected;
  final String name;
  const ListBook({
    Key? key,
    this.selected = false,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      height: 41,
      decoration: BoxDecoration(
        color: (selected) ? greenC : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          name,
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            color: (selected) ? whiteC : greyC,
          ),
        ),
      ),
    );
  }
}
