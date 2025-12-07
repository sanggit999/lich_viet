import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:lich_viet/data/models/lunar_date_model.dart';
import 'package:lich_viet/domain/usecases/get_lunar_date.dart';

import 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final GetLunarDate getLunarDate;
  Timer? _midnightTimer;

  CalendarCubit({required this.getLunarDate}) : super(CalendarInitial());

  Future<void> loadTodayLunarDate() async {
    emit(CalendarLoading());

    final result = await getLunarDate(null);

    result.fold((failure) => emit(CalendarError(failure.message)), (lunarDate) {
      emit(CalendarLoaded(lunarDate));
      _updateWidget(lunarDate);
      _scheduleMidnightUpdate();
    });
  }

  Future<void> loadLunarDateForDate(DateTime date) async {
    emit(CalendarLoading());

    final result = await getLunarDate(date);

    result.fold((failure) => emit(CalendarError(failure.message)), (lunarDate) {
      emit(CalendarLoaded(lunarDate));
      _updateWidget(lunarDate);
    });
  }

  void _scheduleMidnightUpdate() {
    _midnightTimer?.cancel();

    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final duration = tomorrow.difference(now);

    _midnightTimer = Timer(duration, () {
      loadTodayLunarDate();
    });
  }

  Future<void> _updateWidget(dynamic lunarDate) async {
    try {
      // Convert to model if needed
      final model = lunarDate is LunarDateModel
          ? lunarDate
          : LunarDateModel.fromSolarDate(lunarDate.solarDate);

      await HomeWidget.saveWidgetData<String>('lunar_date', model.fullDate);
      await HomeWidget.saveWidgetData<String>(
        'lunar_year',
        model.yearWithCanChi,
      );
      await HomeWidget.saveWidgetData<int>('lunar_day', model.day);
      await HomeWidget.saveWidgetData<String>('lunar_month', model.monthName);
      await HomeWidget.updateWidget(
        androidName: 'LunarWidgetProvider',
        iOSName: 'LunarWidget',
      );
    } catch (e) {
      print('Error updating widget: $e');
    }
  }

  @override
  Future<void> close() {
    _midnightTimer?.cancel();
    return super.close();
  }
}
