import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardRecent extends StatelessWidget {
  final String title;
  final String imageUrl;
  const CardRecent({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: const EdgeInsets.only(left: 20),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: const Color(0xffF3F3F3),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 90,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Image.asset(
                      "assets/elipse.png",
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      "50% Completed",
                      style: greyTextStyle.copyWith(
                        color: const Color(0xffAFAFAF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
