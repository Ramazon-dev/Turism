part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}
class HotelSucces extends HotelState {}
class HotelError extends HotelState {}
class HotelLoading extends HotelState {}
