import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';

import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(
    this.cartRepository,
  ) : super(GetCartInitialState());

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  late final StreamSubscription streamSubscription;

  static GetCartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository cartRepository;

  Cart? products;

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    Either<Failure, Cart> result;
    result = await cartRepository.getCart();
    result.fold((failure) {
      emit(GetCartFailureState(failure.error));
    }, (products) {
      this.products = products;

      emit(GetCartSuccessState(products));
    });
  }
}
