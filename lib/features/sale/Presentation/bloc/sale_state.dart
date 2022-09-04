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
  const SaleLoadedState({
    required this.sales,
  });

  List<double> get getTotal {
    double total = 0;
    double saleTotal = 0;
    double spentTotal = 0;
    for (SaleModel sale in sales) {
        total += sale.getTotal;
        saleTotal += sale.getSaleTotal;
        spentTotal += sale.getSpentTotal;
    }
    return [total,saleTotal,spentTotal];
  }


  @override
  List<Object?> get props => [sales];
}