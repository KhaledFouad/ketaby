import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_state.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit,GetUserProfileState>(builder: (context, state) {
      if(state is GetUserProfileSuccessState){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.profile);
          },
          child: CircleAvatar(
            radius: 24.sp,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 22.sp,
              backgroundColor: AppColors.white,
              child: CachedNetworkImage(
                imageUrl: state.profileModel.data!.image!,
                fit: BoxFit.cover,
                height: double.infinity,
                errorWidget: (context, url, error) => Icon(
                  IconBroken.Info_Square,
                  color: AppColors.primaryColor,
                  size: AppConstants.iconSize24,
                ),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 20.sp,
                ),
              ),
            ),
          ),
        );
      }else{
        return const  SizedBox();
      }
    },);
  }
}