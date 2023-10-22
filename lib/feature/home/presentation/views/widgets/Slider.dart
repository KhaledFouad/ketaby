import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketaby/core/widgets/custom_error_widget.dart';
import 'package:ketaby/core/widgets/custom_network_image.dart';
import 'package:ketaby/feature/home/presentation/cubits/Slider/slider_cubit_cubit.dart';

class SliderWidet extends StatefulWidget {
  const SliderWidet({super.key});

  @override
  State<SliderWidet> createState() => _SliderWidetState();
}

class _SliderWidetState extends State<SliderWidet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderSuccessState) {
          return CarouselSlider.builder(
            itemCount: state.sliderModel.data!.sliders!.length,
            itemBuilder: (context, index, s) => CustomNetworkImage(
              borderRadius: 10.sp,
              image: state.sliderModel.data!.sliders![index].image!,
              discount: 0,
              color: Colors.transparent,
              textColor: Colors.transparent,
              boxfit: BoxFit.cover,
            ),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.65,
              viewportFraction: 0.81,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
          );
        } else if (state is SliderFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
