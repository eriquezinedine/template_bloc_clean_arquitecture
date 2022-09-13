import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale/sale_model.dart';
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
        emit(SaleLoadedState(sales: sales));
    });

    on<AddSaleEvent>((event, emit) {
      // print('hola');
      // _saleRepository.getSales().map((e) => e.detail.firstWhere((element) => false));
      final salesUpdtae = _saleRepository.addSale(event.sale);
      emit(SaleLoadedState(sales: salesUpdtae));
    });

    // on<ChangeTypeEvent>((event, emit) async{
    //   final salesUpdtae =  await _saleRepository.changeTypeSale(event.date,event.detail);
    //   emit(SaleLoadedState(sales: _saleRepository.getSales()));
    // });

    // on<DeleteDatailEvent>((event, emit) async {
    //   int id = createIdSale(event.date);
    //   print('zinedine se elimina');
    //   await _saleRepository.deleteSale(event.date, event.detail);
    //   final stateSles = state as SaleLoadedState;
    //   final newList =  stateSles.sales.map((e) {
    //     if(e.id == id){
    //       e.detail.removeWhere((element) => element.id == event.detail.id);
    //     }
    //     return e;
    //   });
    //   emit(SaleLoadedState(sales: newList.toList()));
    // });

    // on<EditDetailEvent>((event, emit) async{
    //   await _saleRepository.updateDetail(event.date, event.detail);
    //   emit(SaleLoadedState(sales: _saleRepository.getSales()));
    // });

  }
}
