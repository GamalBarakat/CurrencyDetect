// XFile? donationPhoto;
// var pickerPhoto = ImagePicker();
//
// Future getProfileImageByCamera() async {
//   emit(PhotoDonationLoadingState());
//   final pickedFile = await pickerPhoto.pickImage(
//     source: ImageSource.camera,
//   );
//   if (pickedFile != null) {
//     donationPhoto = XFile(pickedFile.path );
//     emit(PhotoDonationSuccessState());
//   } else {
//     print('no image selected');
//     emit(PhotoDonationErrorState());
//   }
// }