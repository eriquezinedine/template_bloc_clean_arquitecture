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

  double getDayTotal( {required int idDay}) {
    double total = 0;
    for (SaleModel sale in sales) {
      if(sale.idDay == idDay && sale.typeSale == TypeSale.pagado){
          total += (sale.count * sale.price);
      }
    }
    return total;
    // return [total,saleTotal,spentTotal];
  }

  double get getTotal {
    double total =0;
    for(SaleModel sale in sales){
      if(sale.typeSale == TypeSale.pagado){
        total += sale.count * sale.price;
      }
    }
    return total;
  }

  double get getsaleTotal {
    double saleTotal =0;
    for(SaleModel sale in sales){
       double value = sale.count * sale.price;
        if(value > 0 && sale.typeSale == TypeSale.pagado){
          saleTotal += value;
        }
    }
    return saleTotal;
  }

  double get getspentTotal {
    double spentTotal =0;
    for(SaleModel sale in sales){
       double value = sale.count * sale.price;
        if(value < 0 && sale.typeSale == TypeSale.pagado){
          spentTotal += value;
        }
    }
    return spentTotal;
  }

  bool searchPerson ( PersonModel person ){
    bool isSpent = false;
  for( SaleModel sale in sales){
    if(sale.person.name == person.name && sale.typeSale == TypeSale.deuda){
      isSpent = true;
      break;
    }
  }
    return isSpent;
  }

  List<SaleModel> getRangeTime(DateTime dateInit, DateTime dateEnd){
    
    return sales;
  }

  @override
  List<Object?> get props => [sales];
}