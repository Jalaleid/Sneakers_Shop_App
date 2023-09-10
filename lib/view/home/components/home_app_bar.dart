import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_shop_app/theme/custom_app_theme.dart';
import 'package:sneakers_shop_app/utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Discover",
        style: AppThemes.homeAppBar,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              color: AppConstantsColor.darkTextColor,
              size: 25,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              color: AppConstantsColor.darkTextColor,
              size: 25,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
