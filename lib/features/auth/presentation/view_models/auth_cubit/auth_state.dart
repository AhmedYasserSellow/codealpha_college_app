part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthPageUpdated extends AuthState {}

final class AdminButtonisLoading extends AuthState {}
