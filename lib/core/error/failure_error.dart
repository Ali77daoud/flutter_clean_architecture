import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

//if no internet
class OffLineFailure extends Failure{
  @override
  List<Object?> get props => [];

}

//if data error from server
class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];

}

//if no data in local database
class EmptyCachFailure extends Failure{
  @override
  List<Object?> get props => [];

}

// user insert wrong data in auth methods login or signup
class WrongDataFailure extends Failure{
  @override
  List<Object?> get props => [];

}