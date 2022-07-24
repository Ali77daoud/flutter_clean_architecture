part of 'them_bloc_bloc.dart';

abstract class ThemBlocEvent extends Equatable {
  const ThemBlocEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemBlocEvent {}
