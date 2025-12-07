import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:home_widget/home_widget.dart';
import 'package:lich_viet/data/repositories/calendar_repository_impl.dart';
import 'package:lich_viet/domain/repositories/calendar_repository.dart';
import 'package:lich_viet/domain/usecases/get_lunar_date.dart';
import 'package:lich_viet/presentation/cubit/calendar_cubit.dart';
import 'package:lich_viet/presentation/pages/home_page.dart';

final sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Home Widget
  await HomeWidget.setAppGroupId('group.com.sanggit999.lich_viet');

  // Setup Dependencies
  setupDependencies();

  runApp(const MyApp());
}

void setupDependencies() {
  // Repository
  sl.registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton(() => GetLunarDate(sl()));

  // Cubit
  sl.registerFactory(() => CalendarCubit(getLunarDate: sl()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lịch Việt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // primarySwatch: Colors.red,
        fontFamily: 'Arial',
        //useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => sl<CalendarCubit>(),
        child: const HomePage(),
      ),
    );
  }
}
