part of 'payment_cubit.dart';

class PaymentState {
  PaymentState({
    this.loading = false,
    this.activeCard = false,
  });

  final bool loading;
  final bool activeCard;

  PaymentState copyWith({
    bool? loading,
    bool? activeCard,
  }) =>
      PaymentState(
        loading: loading ?? this.loading,
        activeCard: activeCard ?? this.activeCard,
      );
}
