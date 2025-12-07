import 'package:dartz/dartz.dart';
import 'package:lich_viet/core/errors/failures.dart';
import 'package:lich_viet/domain/entities/lunar_date.dart';


abstract class CalendarRepository {
  /// Chuyển đổi một ngày dương lịch thành ngày âm lịch
  Future<Either<Failure, LunarDate>> getLunarDate(DateTime date);

  /// Lấy ngày âm lịch của hôm nay
  Future<Either<Failure, LunarDate>> getTodayLunarDate();
}