import 'package:dartz/dartz.dart';
import 'package:lich_viet/core/errors/failures.dart';
import 'package:lich_viet/data/models/lunar_date_model.dart';
import 'package:lich_viet/domain/entities/lunar_date.dart';
import 'package:lich_viet/domain/repositories/calendar_repository.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  @override
  Future<Either<Failure, LunarDate>> getLunarDate(DateTime date) async {
    try {
      final lunarDate = LunarDateModel.fromSolarDate(date);
      return Right(lunarDate);
    } catch (e) {
      return Left(ServerFailure('Không thể chuyển đổi ngày: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, LunarDate>> getTodayLunarDate() async {
    try {
      final now = DateTime.now();
      final lunarDate = LunarDateModel.fromSolarDate(now);
      return Right(lunarDate);
    } catch (e) {
      return Left(
        ServerFailure('Không thể lấy ngày âm lịch hôm nay: ${e.toString()}'),
      );
    }
  }
}
