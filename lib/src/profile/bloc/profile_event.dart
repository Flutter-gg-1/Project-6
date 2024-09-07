part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoadProfileEvent extends ProfileEvent {
  // حدث لتحميل بيانات البروفايل (الوصفات والصورة)
}

class DeleteRecipeEvent extends ProfileEvent {
  final int index;  // الـ index الخاص بالوصفة التي سيتم حذفها

  DeleteRecipeEvent(this.index);
}

class PickImageEvent extends ProfileEvent {
  // حدث لاختيار صورة جديدة من المعرض
}
