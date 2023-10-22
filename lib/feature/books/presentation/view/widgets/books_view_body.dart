import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/loading_indicator_widget.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_cubit.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_state.dart';
import 'package:ketaby/feature/books/presentation/view/widgets/books_list_view_item_horizontal.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(builder: (context, state) {
      if (state is BooksSuccessState ||
          state is GetSearchedBooksList ||
          state is ChangeIsSearchingState) {
        return ListView.separated(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          itemCount: BooksCubit.get(context).searchController.text.isEmpty
              ? BooksCubit.get(context).products.length
              : BooksCubit.get(context).searchedBooksList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => BooksListViewItemHorizontal(
            index: index,
            book: BooksCubit.get(context).searchController.text.isEmpty
                ? BooksCubit.get(context).products[index]
                : BooksCubit.get(context).searchedBooksList[index],
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: AppConstants.padding10h),
        );
      } else if (state is BooksFailureState) {
        return CustomErrorWidget(error: state.error);
      } else {
        return const LoadingIndicatorWidget();
      }
    });
  }
}
