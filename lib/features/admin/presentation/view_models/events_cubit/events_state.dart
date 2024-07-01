part of 'events_cubit.dart';

abstract class EventsState {}

final class AdminInitial extends EventsState {}

final class EventImagePicked extends EventsState {}

final class EventLocationPicked extends EventsState {}

final class UploadEventDataLoading extends EventsState {}

final class UploadEventDataSuccess extends EventsState {}

final class UploadEventDataError extends EventsState {}
