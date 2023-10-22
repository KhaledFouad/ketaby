import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';
import 'package:ketaby/feature/cart/presentation/cubits/update_cart_cubit/update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this.cartRepository) : super(UpdateCartInitialState());

  static UpdateCartCubit get(BuildContext context) => BlocProvider.of(context);

  final CartRepository cartRepository;

  Future<void> updateCart(
      {required String bookId, required String quantity,}) async {
    emit(UpdateCartLoadingState());
    Either<Failure, Cart> result;
    result = await cartRepository.updateCart(bookId: bookId, quantity:quantity);
    result.fold(
          (failure) {
        emit(UpdateCartFailureState(failure.error));
      },
          (cartModel) {
        emit(UpdateCartSuccessState());
      },
    );
  }
}
