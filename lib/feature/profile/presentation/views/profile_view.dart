import 'package:flutter/material.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/core/widgets/logout_icon_button_.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    GetUserProfileCubit.get(context).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: AppColors.primaryColor,
        title: const Text("profile"),
        actions: const [
          Padding(padding: EdgeInsets.all(8.0), child: LogoutIconButton()),
        ],
      ),
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: const AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyleDark,
        child: ProfileViewBody(
        ),
      ),
    );
  }
}
