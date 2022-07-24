import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_archeticture/injection_container.dart' as de;

part 'them_bloc_event.dart';
part 'them_bloc_state.dart';

class ThemBlocBloc extends Bloc<ThemBlocEvent, ThemBlocState> {
  bool isDark = false;

  SharedPreferences sh = de.sl();
  // bool isDark=sh.getBool('isDark')??false;

  ThemBlocBloc() : super(ThemBlocInitial()) {
    on<ThemBlocEvent>((event, emit) async {
      if (event is ChangeThemeEvent) {

        isDark = !isDark;

        await sh.setBool('isDark', isDark).then((value) {
          emit(ChangeThemeState1(isDark: isDark));
        });
      }
    });
  }
}
