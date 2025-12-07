import 'package:dartz/dartz.dart';
import 'package:lich_viet/core/errors/failures.dart';
import 'package:lich_viet/domain/entities/lunar_date.dart';
import 'package:lich_viet/domain/repositories/calendar_repository.dart';

class GetLunarDate {
  final CalendarRepository repository;

  GetLunarDate(this.repository);

  Future<Either<Failure, LunarDate>> call(DateTime? date) async {
    if (date == null) {
      return await repository.getTodayLunarDate();
    }
    return await repository.getLunarDate(date);
  }
}
