part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// الحالة التي يتم فيها تحميل الوصفات من ProfilePage
class ProfileLoaded extends ProfileState {
  final List<Recipe> recipes;  // قائمة الوصفات المحملة
  final XFile? selectedImage;  // الصورة التي تم اختيارها

  ProfileLoaded(this.recipes, this.selectedImage);
}