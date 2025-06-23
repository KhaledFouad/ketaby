import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/config/local/cache_helper.dart';
import 'package:ketaby/config/routes/app_routes.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/core/utils/app_constants.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository_implementation.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/remove_from_cart/remove_from_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/update_cart_cubit/update_cart_cubit.dart';
import 'package:ketaby/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:ketaby/feature/books/data/repository/book_repo_implementation.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_cubit.dart';
import 'package:ketaby/feature/home/data/repository/repository/home_repository_implementaion.dart';
import 'package:ketaby/feature/home/presentation/cubits/BestSeller/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/NewArrival/NewArrival_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/Slider/slider_cubit_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/order/data/repository/order_repository_implementation.dart';
import 'package:ketaby/feature/order/presentation/cubits/create_order_cubit/create_order_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_cubit.dart';
import 'package:ketaby/feature/profile/data/repositry/profile_repository_implementation.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:ketaby/feature/wishList/data/repository/favourites_repository_implementation.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/add_favourites_cubit/add_favourites_cubit.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/remove_favourites_cubit/remove_favourites_cubit.dart';
import 'config/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  AppConstants.token = CacheHelper.getString(key: 'token') ?? '';
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnimatedDrawerCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(
              AuthenticationRepositoryImplementation(
                  ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => SliderCubit(
              HomeRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => BestSellerCubit(
              HomeRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => NewArrivalCubit(
              HomeRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(
              HomeRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => BooksCubit(
              BookRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => AddToFavouritesCubit(
              FavouritesRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => RemoveFrmoFavouritesCubit(
              FavouritesRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => GetFavouritesCubit(
              FavouritesRepositoryImplementation(ApiServicesImplementation()),
              AddToFavouritesCubit(FavouritesRepositoryImplementation(
                  ApiServicesImplementation()))),
        ),
        BlocProvider(
          create: (context) => GetCartCubit(
            CartRepositoryImplementation(ApiServicesImplementation()),
          ),
        ),
        BlocProvider(
          create: (context) => AddToCartCubit(
              CartRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => RemoveFromCartCubit(
              CartRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => UpdateCartCubit(
              CartRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => GetCheckoutDataCubit(
              OrderRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => GetGovernoratesCubit(
              OrderRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => CreateOrderCubit(
              OrderRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => GetUserProfileCubit(
              ProfileRepositoryImplementation(ApiServicesImplementation())),
        ),
        BlocProvider(
          create: (context) => UpdateUserProfileCubit(
              ProfileRepositoryImplementation(ApiServicesImplementation())),
        ),
      ],
      child: const KetabyApp(),
    ),
  );
}

class KetabyApp extends StatelessWidget {
  const KetabyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
