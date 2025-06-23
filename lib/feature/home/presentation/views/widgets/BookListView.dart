import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/home/presentation/cubits/BestSeller/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/BestSeller/best_seller_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/BookCard.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              height: 250.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BookCard(
                  product: state.bestSellerModel.data!.products![index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: AppConstants.padding10w,
                ),
                itemCount: state.bestSellerModel.data!.products!.length,
              ),
            ),
          );
        } else if (state is BestSellerFailureState) {
          return CustomErrorWidget(error: state.error.toString());
        } else {
          return const Center(
            child: LoadingIndicatorWidget(),
          );
        }
      },
    );
  }
}
