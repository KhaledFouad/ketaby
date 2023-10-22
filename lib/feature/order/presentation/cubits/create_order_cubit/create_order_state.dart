import 'package:ketaby/feature/order/data/models/create_order_model/create_order_model.dart';

abstract class CreateOrderState{}

class CreateOrderInitialState extends CreateOrderState{}
class CreateOrderLoadingState extends CreateOrderState{}
class CreateOrderSuccessState extends CreateOrderState{
  final CreateOrderModel createOrderModel;

  CreateOrderSuccessState(this.createOrderModel);
}
class CreateOrderFailureState extends CreateOrderState{
  final String error;

  CreateOrderFailureState(this.error);
}