import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/feature/home/presentation/cubits/animated_drawer_cubit/animated_drawer_state.dart';

class AnimatedDrawerCubit extends Cubit<AnimatedDrawerState> {
  AnimatedDrawerCubit() : super(AnimatedDrawerInitialState());

  static AnimatedDrawerCubit get(BuildContext context) =>
      BlocProvider.of(context);

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isOpenDrawer = false;

  double xOffset2 = 0;
  double yOffset2 = 0;
  double scaleFactor2 = 1;

  void openDrawer() {
    xOffset = 230;
    yOffset = 130;
    scaleFactor = 0.7;

    isOpenDrawer = true;

    xOffset2 = 205;
    yOffset2 = 170;
    scaleFactor2 = 0.6;
    emit(OpenDrawerState());
  }

  void closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;

    isOpenDrawer = false;

    xOffset2 = 0;
    yOffset2 = 0;
    scaleFactor2 = 1;
    emit(CloseDrawerState());
  }
}
