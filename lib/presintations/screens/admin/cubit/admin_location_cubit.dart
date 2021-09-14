import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_location_state.dart';

class AdminLocationCubit extends Cubit<AdminLocationState> {
  AdminLocationCubit() : super(AdminLocationInitial());
}
