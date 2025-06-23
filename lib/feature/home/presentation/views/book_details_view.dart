import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_bottom_nav_bar.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.black.withOpacity(0.4),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        extendBody: true,
        body: BookDetailsViewBody(
          book: book,
        ),
        bottomNavigationBar: BookDetailBottomNavBar(
          book: book,
        ),
      ),
    );
  }
}
