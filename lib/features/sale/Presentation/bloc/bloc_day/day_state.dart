part of 'day_bloc.dart';

abstract class DayState extends Equatable {
  const DayState();
}

class DayInitial extends DayState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DayLoadedState extends DayState{
  final List<DayModel> days;
  const DayLoadedState({
    required this.days,
  });

  // List<double> get getTotal {
  //   double total = 0;
  //   double saleTotal = 0;
  //   double spentTotal = 0;
  //   for (SaleModel sale in sales) {
  //       total += sale.getTotal;
  //       saleTotal += sale.getSaleTotal;
  //       spentTotal += sale.getSpentTotal;
  //   }
  //   return [total,saleTotal,spentTotal];
  // }


  @override
  List<Object?> get props => [days];
}