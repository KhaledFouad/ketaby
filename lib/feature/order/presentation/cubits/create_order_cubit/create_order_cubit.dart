import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/core/functions/show_snack_bar.dart';
import 'package:ketaby/feature/order/data/models/create_order_model/create_order_model.dart';
import 'package:ketaby/feature/order/data/repository/order_repository.dart';
import 'package:ketaby/feature/order/presentation/cubits/create_order_cubit/create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(this.orderRepository) : super(CreateOrderInitialState());

  final OrderRepository orderRepository;

  static CreateOrderCubit get(BuildContext context) => BlocProvider.of(context);

  CreateOrderModel? createOrderModel;

  Future<void> createOrder({
    required String name,
    required String email,
    required String address,
    required String phone,
    required String governoratesId,
    required BuildContext context,
  }) async {
    emit(CreateOrderLoadingState());
    Either<Failure, CreateOrderModel> result =
        await orderRepository.createOrder(
      name: name,
      email: email,
      address: address,
      phone: phone,
      governoratesId: governoratesId,
    );
    result.fold(
      (failure) {
        showErrorSnackBar(context: context, message: failure.error);
        emit(CreateOrderFailureState(failure.error));
      },
      (createOrderModel) {
        this.createOrderModel = createOrderModel;
        showSuccessSnackBar(
          context: context,
          message: createOrderModel.message!,
        );
        emit(CreateOrderSuccessState(createOrderModel));
      },
    );
  }
}
