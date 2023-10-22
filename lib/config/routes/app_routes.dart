import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/animations/page_fade_transition.dart';
import 'package:ketaby/core/animations/page_slide_transition.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/core/utils/app_strings.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository_implementation.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/view/cart_view.dart';
import 'package:ketaby/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:ketaby/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:ketaby/feature/authentication/presentation/views/login_view.dart';
import 'package:ketaby/feature/authentication/presentation/views/register_view.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/books/data/repository/book_repo_implementation.dart';
import 'package:ketaby/feature/books/presentation/cubit/books_cubit.dart';
import 'package:ketaby/feature/books/presentation/view/books_view.dart';
import 'package:ketaby/feature/home/data/repository/repository/home_repository_implementaion.dart';
import 'package:ketaby/feature/home/presentation/cubits/BestSeller/best_seller_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/NewArrival/NewArrival_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/Slider/slider_cubit_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:ketaby/feature/home/presentation/views/book_details_view.dart';
import 'package:ketaby/feature/home/presentation/views/home_view.dart';
import 'package:ketaby/feature/layout.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:ketaby/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:ketaby/feature/order/data/repository/order_repository_implementation.dart';
import 'package:ketaby/feature/order/presentation/cubits/create_order_cubit/create_order_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_checkout_data_cubit/get_checkout_data_cubit.dart';
import 'package:ketaby/feature/order/presentation/cubits/get_governorates_cubit/get_governorates_cubit.dart';
import 'package:ketaby/feature/order/presentation/views/checkout_view.dart';
import 'package:ketaby/feature/profile/data/model/profile_model.dart';
import 'package:ketaby/feature/profile/data/repositry/profile_repository_implementation.dart';
import 'package:ketaby/feature/profile/presentation/cubits/get_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:ketaby/feature/profile/presentation/views/profile_view.dart';
import 'package:ketaby/feature/profile/presentation/views/update_profile_view.dart';
import 'package:ketaby/feature/splash/presentation/views/splash_view.dart';

class Routes {
  static const String slashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
  static const String loginView = '/login_view';
  static const String layout = '/layout';
  static const String homeView = '/home_view';
  static const String booksView = '/books_view';
  static const String bookDetailsView = '/book_details_view';
  static const String cartView = '/cart_view';
  static const String profile = '/profile_view';
  static const String updateProfileView = '/update_profile_view';
  static const String checkoutView = '/checkout_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
          ),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => RegisterCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const RegisterView(),
          ),
        );
      case Routes.layout:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: const Layout(),
        );

      case Routes.homeView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(
            providers: [
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
            ],
            child: const HomeView(),
          ),
        );
      case Routes.profile:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => GetUserProfileCubit(
                ProfileRepositoryImplementation(ApiServicesImplementation())),
            child: const ProfileView(),
          ),
        );
        case Routes.updateProfileView:
        final profileModel = settings.arguments as ProfileModel;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
              create: (context) =>
              UpdateUserProfileCubit(
                  ProfileRepositoryImplementation(ApiServicesImplementation())),
              child: UpdateProfileView(profileModel: profileModel,)),
        );
      case Routes.booksView:
        return PageSlideTransition(
          page: BlocProvider(
            create: (context) => BooksCubit(
                BookRepositoryImplementation(ApiServicesImplementation())),
            child: const BooksView(),
          ),
          direction: AxisDirection.left,
        );
      case Routes.bookDetailsView:
        final book = settings.arguments as Product;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BookDetailsView(book: book),
        );
      case Routes.cartView:
        return PageSlideTransition(
          page: BlocProvider(
            create: (context) => GetCartCubit(
                CartRepositoryImplementation(ApiServicesImplementation())),
            child: const CartView(),
          ),
          direction: AxisDirection.left,
        );

      case Routes.checkoutView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: MultiBlocProvider(
            providers: [
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
            ],
            child: const CheckoutView(),
          ),
        );
      //   case Routes.appointmentDetailsView:
      // final appointment = settings.arguments as Appointment;
      // return PageSlideTransition(
      //   page: AppointmentDetailsView(appointment: appointment),
      //   direction: AxisDirection.left,
      // );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
