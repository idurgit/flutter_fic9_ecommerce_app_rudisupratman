import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/datasources/order_remote_datasource.dart';
import '../../../../data/models/requests/add_address_request_model.dart';
import '../../../../data/models/responses/add_address_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(const _Initial()) {
    on<_AddAddress>((event, emit) async {
      emit(const _Loading());
      final response =
          await OrderRemoteDatasource().addAddress(AddAddressRequestModel(
              data: AddAdress(
        name:
            '${event.address}, ${event.subdistrictName}, ${event.cityName}, ${event.provinceName}, ${event.postalCode}',
        address: event.address,
        phone: event.phone,
        provId: event.provId,
        cityId: event.cityId,
        subdistrictId: event.subdistrictId,
        postalCode: event.postalCode,
        userId: event.userId,
        isDefault: event.isDefault,
      )));

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
