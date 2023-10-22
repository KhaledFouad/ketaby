import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/feature/onboarding/presentation/cubit/onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  List<String> titles = [
    "Welcome to Ketaby, your gateway to a world of books.",
    "With ketaby, you can browse, buy, and build your digital library effortlessly.",
    "Let's embark on a literary adventure together!"
  ];

  bool isLast = false;

  void onChangePageView(int index) {
    if (index == titles.length - 1) {
      isLast = true;
      emit(OnChangePageViewState());
    } else {
      isLast = false;
      emit(OnChangePageViewState());
    }
  }
}
