part of 'sale_bloc.dart';

abstract class SaleEvent extends Equatable {
  const SaleEvent();
}

class LoadSaleEvent extends SaleEvent {
  const LoadSaleEvent();
  
  @override
  List<Object?> get props => [];
}


class AddSaleEvent extends SaleEvent{
  final DateTime date;
  final DetailSaleModel detail;
  const AddSaleEvent({required this.date, required this.detail});

  @override
  List<Object?> get props => [];
}
