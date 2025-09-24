import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkThem()); // يبدأ بالوضع Light

  void changeThemeToDark() => emit(DarkThem());

  void changeThemeToLight() => emit(LightThem());

  void toggleTheme() {
    if (state is LightThem) {
      emit(DarkThem());
    } else {
      emit(LightThem());
    }
  }
}
