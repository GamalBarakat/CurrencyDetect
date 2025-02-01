import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/feature/Home/manager/home_cubit.dart';
import 'package:project/feature/Home/manager/home_state.dart';

import 'image_result_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191818),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Currency detection application',
          style: GoogleFonts.actor(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: const Color(0xff191818),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is PhotoSuccessState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageResultScreen(
                      homeCubit: BlocProvider.of<HomeCubit>(context),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Use live camera ',
                    style: GoogleFonts.actor(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  10.verticalSpace,
                  InkWell(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context).getProfileImageByCamera();
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/image/live.svg',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                  60.verticalSpace,
                  Text(
                    'Use camera ',
                    style: GoogleFonts.actor(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  10.verticalSpace,
                  InkWell(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context).getProfileImageByGallery();
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/image/camera.svg',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
