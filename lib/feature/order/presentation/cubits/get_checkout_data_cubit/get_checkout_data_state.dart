import 'package:ketaby/feature/order/data/models/checkout_model/checkout_model.dart';

abstract class GetCheckoutDataState{}

class GetCheckoutDataInitialState extends GetCheckoutDataState{}
class GetCheckoutDataLoadingState extends GetCheckoutDataState{}
class GetCheckoutDataSuccessState extends GetCheckoutDataState{
  final CheckoutModel checkoutModel;

  GetCheckoutDataSuccessState(this.checkoutModel);
}
class GetCheckoutDataFailureState extends GetCheckoutDataState{
  final String error;

  GetCheckoutDataFailureState(this.error);
}