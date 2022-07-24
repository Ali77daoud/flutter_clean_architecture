part of 'them_bloc_bloc.dart';

abstract class ThemBlocState extends Equatable {
  const ThemBlocState();
  
  @override
  List<Object> get props => [];
}

class ThemBlocInitial extends ThemBlocState {}

class ChangeThemeState1 extends ThemBlocState{
  final bool isDark;

  const ChangeThemeState1({required this.isDark});
  @override
  List<Object> get props => [isDark];
}


