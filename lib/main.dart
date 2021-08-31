import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Network/dio_helper.dart';
import 'package:news/Network/shared/shared_preferance.dart';
import 'package:news/constance..dart';
import 'package:news/layout/cubit/Cubit.dart';
import 'package:news/main_cubit/main_cubit.dart';
import 'package:news/main_cubit/state_cubit.dart';
import 'package:news/observer/observer.dart';
import 'layout/News_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await Shared.init();
  bool? isDark = Shared.getBoolean(key: 'isDark');
  runApp(Home(isDark));
}

class Home extends StatelessWidget {
  final bool? isDark;

  Home(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusinessData()),
        BlocProvider(
          create: (context) =>
              MainCubit()..changeAppTheme(sharedLastTheme: isDark),
        )
      ],
      child: BlocConsumer<MainCubit ,MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: MainCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsScreen(),
          );
        },
      ),
    );
  }
}
