import 'package:lich_viet/core/utils/lunar_calendar_util.dart';
import 'package:lich_viet/domain/entities/lunar_date.dart';


class LunarDateModel extends LunarDate {
  const LunarDateModel({
    required super.day,
    required super.month,
    required super.year,
    required super.isLeapMonth,
    required super.canChi,
    required super.monthName,
    required super.solarDate,
  });

  factory LunarDateModel.fromSolarDate(DateTime solarDate) {
    const timeZone = 7; // UTC+7 for Vietnam

    final lunarData = LunarCalendarUtil.convertSolar2Lunar(
      solarDate.day,
      solarDate.month,
      solarDate.year,
      timeZone,
    );

    return LunarDateModel(
      day: lunarData['day'],
      month: lunarData['month'],
      year: lunarData['year'],
      isLeapMonth: lunarData['isLeapMonth'],
      canChi: LunarCalendarUtil.getCanChi(lunarData['year']),
      monthName: LunarCalendarUtil.monthNames[lunarData['month'] - 1],
      solarDate: solarDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'month': month,
      'year': year,
      'isLeapMonth': isLeapMonth,
      'canChi': canChi,
      'monthName': monthName,
      'fullDate': fullDate,
      'yearWithCanChi': yearWithCanChi,
    };
  }
}
