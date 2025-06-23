import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CacheHelper.removeData(key: 'token').then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginView, (route) => false);
        });
      },
      icon: Icon(
        IconBroken.Logout,
        color: AppColors.white,
        size: AppConstants.iconSize28,
      ),
    );
  }
}
