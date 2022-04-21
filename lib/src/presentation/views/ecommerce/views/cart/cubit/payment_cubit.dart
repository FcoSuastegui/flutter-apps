import 'package:bloc/bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState());

  setActiveCard(bool active) {
    emit(state.copyWith(activeCard: active));
  }

  Future<void> onPay() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(milliseconds: 1200));
    emit(state.copyWith(loading: false));
  }
}
