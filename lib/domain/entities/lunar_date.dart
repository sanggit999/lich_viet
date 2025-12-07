import 'package:equatable/equatable.dart';

class LunarDate extends Equatable {
  final int day;
  final int month;
  final int year;
  final bool isLeapMonth;
  final String canChi;
  final String monthName;
  final DateTime solarDate;

  const LunarDate({
    required this.day,
    required this.month,
    required this.year,
    required this.isLeapMonth,
    required this.canChi,
    required this.monthName,
    required this.solarDate,
  });

  String get fullDate {
    String leapPrefix = isLeapMonth ? 'nhuận ' : '';
    return 'Ngày $day tháng $leapPrefix$monthName';
  }

  String get yearWithCanChi {
    return 'Năm $canChi ($year)';
  }

  @override
  List<Object?> get props => [
    day,
    month,
    year,
    isLeapMonth,
    canChi,
    monthName,
    solarDate,
  ];
}