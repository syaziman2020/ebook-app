import 'package:ebook_app/cubit/auth_cubit.dart';
import 'package:ebook_app/cubit/current_page_cubit.dart';
import 'package:ebook_app/shared/theme.dart';
import 'package:ebook_app/ui/pages/checkout_page.dart';
import 'package:ebook_app/ui/pages/detail_page.dart';
import 'package:ebook_app/ui/pages/save_books_page.dart';
import 'package:ebook_app/ui/pages/user_page.dart';
import 'package:ebook_app/ui/widgets/card_recent.dart';
import 'package:ebook_app/ui/widgets/card_trending.dart';
import 'package:ebook_app/ui/widgets/list_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/no-profile.png"),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthSuccess) {
                        return Text(
                          "Hello ${state.user.name},",
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        );
                      } else {
                        return Text(
                          "Hello,",
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    "Good Morning",
                    style: greyTextStyle.copyWith(),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/menu.png",
              width: 18,
              fit: BoxFit.cover,
            )
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: creamC,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    cursorColor: greenC,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find Your Favorite Book",
                      hintStyle: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    ),
                  ),
                ),
                width: 250,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: greenC,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/search.png",
                    width: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget recent({String title = ''}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget cardRecent() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const CardRecent(
                  title: "The Magic",
                  imageUrl: "assets/magic.png",
                ),
              ),
              const CardRecent(
                title: "The Martian",
                imageUrl: "assets/martian.png",
              ),
            ],
          ),
        ),
      );
    }

    Widget listBooks() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            children: const [
              ListBook(
                name: "All Books",
                selected: true,
              ),
              ListBook(
                name: "Comic",
              ),
              ListBook(
                name: "Novel",
              ),
              ListBook(
                name: "Manga",
              ),
              ListBook(
                name: "Fairy Tales",
              ),
            ],
          ),
        ),
      );
    }

    Widget listTrending() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailPage(),
                    ),
                  );
                },
                child: const CardTrend(
                  imageUrl: "assets/guy.png",
                  name: "Guy Kawasaki",
                  title: "Enchanted",
                ),
              ),
              const CardTrend(
                imageUrl: "assets/lore.png",
                name: "Aaron Mahnke",
                title: "LOre",
              ),
              const CardTrend(
                imageUrl: "assets/cheese.png",
                name: "Spencer Johnson, M.D",
                title: "Who Moved My Cheese",
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: whiteC,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                search(),
                recent(title: "Recent Book"),
                const SizedBox(
                  height: 12,
                ),
                cardRecent(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          listBooks(),
          const SizedBox(
            height: 30,
          ),
          recent(title: "Trending Now"),
          const SizedBox(
            height: 12,
          ),
          listTrending(),
        ],
      );
    }

    Widget buildContent(int index) {
      switch (index) {
        case 1:
          return content();
        case 2:
          return const SaveBooks();
        case 3:
          return const CheckoutPage();
        case 4:
          return const UserContent();
        default:
          return content();
      }
    }

    return Scaffold(
      backgroundColor: creamC,
      bottomNavigationBar: const BottomNavbar(),
      body: BlocBuilder<CurrentPageCubit, int>(
        builder: (context, state) {
          return buildContent(state);
        },
      ),
    );
  }
}
