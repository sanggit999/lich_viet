import 'package:equatable/equatable.dart';
import 'package:lich_viet/domain/entities/lunar_date.dart';


abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object?> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final LunarDate lunarDate;

  const CalendarLoaded(this.lunarDate);

  @override
  List<Object?> get props => [lunarDate];
}

class CalendarError extends CalendarState {
  final String message;

  const CalendarError(this.message);

  @override
  List<Object?> get props => [message];
}