import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestorantState> {
  RestaurantCubit() : super(RestorantInitial());
}
