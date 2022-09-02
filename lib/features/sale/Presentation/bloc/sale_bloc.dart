import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Repository/sale_local_repository.dart';
import 'package:equatable/equatable.dart';

part 'sale_event.dart';
part 'sale_state.dart';

class SaleBloc extends Bloc<SaleEvent, SaleState> {
  final SaleRepository _saleRepository;

  @override
  Future<void> close() {
    // dispose
    print('se cerro');
    return super.close();
  }

  SaleBloc(this._saleRepository) : super(SaleInitial()) {
    on<SaleEvent>((event, emit) {
        final sales = _saleRepository.getSales();
        emit(SaleLoadedState(sales));
    });

    on<AddSaleEvent>((event, emit) {
      // print('hola');
      // _saleRepository.getSales().map((e) => e.detail.firstWhere((element) => false));
      final salesUpdtae = _saleRepository.addSale(event.date,event.detail);
      emit(SaleLoadedState(salesUpdtae));
    });

  }
}