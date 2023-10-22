import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/feature/Cart/presentation/view/cart_view.dart';
import 'package:ketaby/feature/books/presentation/view/books_view.dart';
import 'package:ketaby/feature/home/presentation/views/home_view.dart';
import 'package:ketaby/feature/wishList/presentation/view/favourites_view.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const <Widget>[
            HomeView(),
            BooksView(),
            FavouritesView(),
            CartView(),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          waterDropColor: AppColors.primaryColor,
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home_filled,
              outlinedIcon: Icons.home_filled,
            ),
            BarItem(
              filledIcon: Icons.book,
              outlinedIcon: Icons.book_outlined,
            ),
            BarItem(
                filledIcon: Icons.favorite_rounded,
                outlinedIcon: Icons.favorite_border_rounded),
            BarItem(
              filledIcon: Icons.shopping_cart,
              outlinedIcon: Icons.shopping_cart_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
