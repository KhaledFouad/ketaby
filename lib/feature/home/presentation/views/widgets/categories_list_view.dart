import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children:
                    state.categoriesModel.data!.categories!.map((category) {
                  return Container(
                    width: 130.w,
                    height: 125.h,
                    // padding: EdgeInsets.all(AppConstants.padding10h),
                    margin: EdgeInsets.only(
                      right: AppConstants.padding10w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius8sp),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/category.png",
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 130.w,
                            height: 125.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.4),
                              borderRadius:
                                  BorderRadius.circular(AppConstants.radius8sp),
                            ),
                          ),
                          Center(
                            child: Text(
                              category.name!,
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle20.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        } else if (state is CategoriesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
