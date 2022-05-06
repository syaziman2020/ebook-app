import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardTrend extends StatelessWidget {
  final String title;
  final String name;
  final String imageUrl;
  const CardTrend(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 110,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Text(
            name,
            style: greyTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }
}
