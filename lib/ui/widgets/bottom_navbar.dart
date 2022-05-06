import 'package:ebook_app/cubit/current_page_cubit.dart';
import 'package:ebook_app/ui/widgets/bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 70,
      color: whiteC,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomItem(
              index: 1,
              imageUrl: "assets/home.png",
              onTap: () {
                context.read<CurrentPageCubit>().changePage(1);
              },
            ),
            BottomItem(
              imageUrl: "assets/list.png",
              onTap: () {
                context.read<CurrentPageCubit>().changePage(2);
              },
              index: 2,
              width: 16,
            ),
            BottomItem(
              imageUrl: "assets/shop.png",
              onTap: () {
                context.read<CurrentPageCubit>().changePage(3);
              },
              index: 3,
            ),
            BottomItem(
              imageUrl: "assets/people.png",
              onTap: () {
                context.read<CurrentPageCubit>().changePage(4);
              },
              index: 4,
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
