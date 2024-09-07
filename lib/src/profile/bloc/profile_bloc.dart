import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/recipe_data.dart';
import 'package:project6/models/recipe.dart';
import 'package:project6/services/setup.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RecipeData _recipeData = locator.get<RecipeData>();  // Access RecipeData

  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<DeleteRecipeEvent>(_onDeleteRecipe);
    on<PickImageEvent>(_onPickImage);
  }

  // Load the initial recipes
  Future<void> _onLoadProfile(LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoaded(_recipeData.recipes, null));
  }

  // Handle recipe deletion
  Future<void> _onDeleteRecipe(DeleteRecipeEvent event, Emitter<ProfileState> emit) async {
    _recipeData.recipes.removeAt(event.index);
    emit(ProfileLoaded(_recipeData.recipes, (state as ProfileLoaded).selectedImage));
  }

  // Handle image picking
  Future<void> _onPickImage(PickImageEvent event, Emitter<ProfileState> emit) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    emit(ProfileLoaded(_recipeData.recipes, pickedImage));
  }
}
