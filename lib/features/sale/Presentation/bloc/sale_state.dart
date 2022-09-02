part of 'sale_bloc.dart';

abstract class SaleState extends Equatable {
  const SaleState();
}

class SaleInitial extends SaleState {
  @override
  List<Object> get props => [];
}


class SaleLoadedState extends SaleState{
  final List<SaleModel> sales;
  const SaleLoadedState(this.sales);

  double get getTotal {
      double total = 0;
    for (SaleModel sale in sales) {
      for (DetailSaleModel detail in sale.detail) {
         total = total + (detail.count * detail.price);
      }
    }

    return total;
  }

  @override
  List<Object?> get props => [sales];
}