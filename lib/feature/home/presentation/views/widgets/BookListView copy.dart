import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/feature/home/presentation/cubits/NewArrival/NewArrival_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/NewArrival/NewArrival_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/BookCard.dart';

class BooksListView2 extends StatelessWidget {
  const BooksListView2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalCubit, NewArrivalState>(
      builder: (context, state) {
        if (state is NewArrivalSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SizedBox(
              height: 250.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BookCard(
                  product: state.newArrivalModel.data!.products![index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: AppConstants.padding10w,
                ),
                itemCount: state.newArrivalModel.data!.products!.length,
              ),
            ),
          );
        } else if (state is NewArrivalFailureState) {
          return CustomErrorWidget(error: state.error.toString());
        } else {
          return SizedBox();
        }
      },
    );
  }
}
