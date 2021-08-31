import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Network/shared/shared_preferance.dart';
import 'package:news/main_cubit/state_cubit.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitState());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppTheme({bool? sharedLastTheme}) {
    if (sharedLastTheme != null) {
     isDark = sharedLastTheme ;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      Shared.setBoolean(key: 'isDark', value: isDark)
          .then((value) => {emit(ChangeModeState())});
    }
  }
}
