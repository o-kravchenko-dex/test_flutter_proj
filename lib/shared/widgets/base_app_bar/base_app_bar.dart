import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_flutter_pr/shared/shared.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool withBackButton;

  const BaseAppBar(this.title, {super.key, this.withBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: withBackButton
          ? IconButton(
              icon: Icon(AppIcons.back, color: AppColors.blue6),
              onPressed: () {
                GoRouter router = GoRouter.of(context);
                return router.pop();
              },
            )
          : null,
      title: Label(title ?? ""),
      backgroundColor: AppColors.green6,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
