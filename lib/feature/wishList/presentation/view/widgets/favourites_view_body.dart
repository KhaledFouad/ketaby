import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/feature/Cart/presentation/view/widgets/cart_is_empty_widget.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/get_favourites_cubit/get_favourites_state.dart';
import 'package:ketaby/feature/wishList/presentation/view/widgets/wishListviewItemHorizontal.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouritesCubit, GetFavouritesState>(
      builder: (context, state) {
        if (state is GetFavouritesSuccessState) {
          if (state.prudutes.isEmpty) {
            return const CartIsEmptyWidget();
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemBuilder: (context, index) {
              return WishListviewItemHorizontal(
                book: state.prudutes[index],
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: state.prudutes.length,
          );
        } else if (state is GetFavouritesFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
