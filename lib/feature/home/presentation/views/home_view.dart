import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/feature/home/presentation/cubits/BestSeller/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/NewArrival/NewArrival_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/Slider/slider_cubit_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/BookListView%20copy.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/BookListView.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/CategoryTitle.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/Drawer.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/Slider.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/appBar.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/categories_list_view.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';

class HomeView extends StatefulWidget {
  // final User user;
  const HomeView({
    super.key,
    // required this.user
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SliderCubit.get(context).getSliderss();
    BestSellerCubit.get(context).getBestSeller();
    NewArrivalCubit.get(context).getNewArrivl();
    CategoriesCubit.get(context).getCategories();
    GetUserProfileCubit.get(context).getUserProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const HomeAppBar(
                // user: widget.user,
                ),
            SizedBox(
              height: 10.h,
            ),
            const SliderWidet(),
            SizedBox(
              height: 10.h,
            ),
            const CategoryTitle(tilte: "Best Seller"),
            const BooksListView(),
            // PageIndicatorWidget(pageController: pageController, count: 3),
            const CategoryTitle(tilte: "Categories"),
            const CategoriesListView(),
            const CategoryTitle(tilte: "New Arrivals"),
            const BooksListView2(),
          ],
        ),
      ),
    );
  }
}
