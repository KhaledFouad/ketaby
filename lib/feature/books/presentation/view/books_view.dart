import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_cubit.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_state.dart';
import 'package:ketaby/feature/books/presentation/view/widgets/books_view_body.dart';
import 'package:ketaby/feature/books/presentation/view/widgets/search_text_field.dart';

class BooksView extends StatefulWidget {
  const BooksView({super.key});

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  void initState() {
    BooksCubit.get(context).getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: BooksCubit.get(context).isSearching
                ? SearchTextField(
                    controller: BooksCubit.get(context).searchController,
                    onChange: (value) {
                      if (!value.startsWith(' ')) {
                        BooksCubit.get(context).getSearchedDoctorsList(
                          bookName: value,
                        );
                      }
                    },
                  )
                : const Text('Books'),
            actions: [
              BooksCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        BooksCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        BooksCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.white,
                      ),
                    ),
            ],
          ),
          body: const BooksViewBody(),
        );
      },
    );
  }
}
