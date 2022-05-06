import 'package:ebook_app/cubit/current_page_cubit.dart';
import 'package:ebook_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  final Function() onTap;
  final double width;
  const BottomItem({
    Key? key,
    required this.imageUrl,
    required this.onTap,
    required this.index,
    this.width = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPageCubit, int>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Image.asset(
            imageUrl,
            color: (index == state) ? greenC : greyC,
            width: width,
          ),
        );
      },
    );
  }
}
