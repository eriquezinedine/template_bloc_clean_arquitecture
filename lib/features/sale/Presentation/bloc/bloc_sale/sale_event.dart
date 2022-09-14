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
  final SaleModel sale;
  const AddSaleEvent({required this.sale});

  @override
  List<Object?> get props => [];
}


class ChangeTypeEvent extends SaleEvent{
  final DateTime date;
  final SaleModel detail;
  const ChangeTypeEvent({required this.date, required this.detail});

  @override
  List<Object?> get props => [];
}


class DeleteSaleEvent extends SaleEvent{
  final DateTime date;
  final SaleModel sale;
  const DeleteSaleEvent({required this.date, required this.sale});

  @override
  List<Object?> get props => [];
}


class EditSaleEvent extends SaleEvent{
  final DateTime date;
  final SaleModel sale;
  const EditSaleEvent({required this.date, required this.sale});

  @override
  List<Object?> get props => [];
}

// class EditDetailEvent extends SaleEvent{
//   final DateTime date;
//   final DetailSaleModel detail;
//   const EditDetailEvent({required this.date, required this.detail});

//   @override
//   List<Object?> get props => [];
// }
