import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_state.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    //  required this.user
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  // final User user;
  // @override
  // void initState() {
  //   GetUserProfileCubit.get(context).getUserProfile();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // print(user.name);
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        if (state is GetUserProfileSuccessState) {
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: ListTile(
              title: Text(
                "Hi, ${state.profileModel.data!.name!}",
                style: AppStyles.textStyle25
                    .copyWith(color: AppColors.primaryColor),
              ),
              subtitle: Text(
                "what are u reading today?",
                style: AppStyles.textStyle14,
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.profile);
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 30.sp,
                  backgroundImage:
                      NetworkImage(state.profileModel.data!.image!),
                ),
              ),
              leading: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Icon(
                  Icons.menu_rounded,
                  color: AppColors.black,
                  size: 30.sp,
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
