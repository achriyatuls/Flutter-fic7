import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment/data/models/auth_response_model.dart';
import 'package:payment/data/models/request/register_request_model.dart';
import 'package:payment/data/datasources/auth_remote_datasource.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await AuthRemoteDatasource().register(event.model);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
