import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/feature/Home/manager/home_state.dart';




class HomeCubit extends Cubit<HomeState> {
  HomeCubit() :super(InitializeHomeState());
  XFile? currencyPhoto;
  var pickerPhoto = ImagePicker();

  Future getProfileImageByCamera() async {
    emit(PhotoLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      currencyPhoto = XFile(pickedFile.path );
      emit(PhotoSuccessState());
    } else {
      print('no image selected');
      emit(PhotoErrorState());
    }
  }
  Future getProfileImageByGallery() async {
    emit(PhotoLoadingState());
    final pickedFile = await pickerPhoto.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      currencyPhoto = XFile(pickedFile.path );
      emit(PhotoSuccessState());
    } else {
      print('no image selected');
      emit(PhotoErrorState());
    }
  }
}