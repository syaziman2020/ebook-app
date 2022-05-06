import 'package:ebook_app/shared/theme.dart';
import 'package:ebook_app/ui/widgets/custom_button.dart';
import 'package:ebook_app/ui/widgets/item_rate.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/back.png",
                width: 8,
              ),
            ),
            Text(
              "Book Details",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
            Image.asset(
              "assets/share.png",
              width: 17,
            ),
          ],
        ),
      );
    }

    Widget pictEbook() {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          height: 267,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/guy.png"),
            ),
          ),
        ),
      );
    }

    Widget bottomContent() {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 25,
              left: 30,
              right: 30,
            ),
            decoration: BoxDecoration(
              color: whiteC,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enchantment",
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          "Guy Kawasaki",
                          style: greyTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Free Access",
                      style: greenTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Description",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Enchantment, as defined by bestselling business\nguru Guy Kawasaki, is not about manipulating\npeople. It transforms situations and relationships.",
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const ItemRate(
                            name: "Rating",
                            value: "4.8",
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            decoration: BoxDecoration(
                              color: const Color(0xff6B6B6B),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const ItemRate(
                            name: "Number of pages",
                            value: "180 Page",
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            decoration: BoxDecoration(
                              color: const Color(0xff6B6B6B),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const ItemRate(
                            name: "Language",
                            value: "ENG",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: "Read Now",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: greenC,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/list_1.png",
                    width: 14,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: creamC,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            pictEbook(),
            const Spacer(),
            bottomContent(),
          ],
        ),
      ),
    );
  }
}
