import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/feature/Home/manager/home_cubit.dart';
import 'package:project/feature/Home/manager/home_state.dart';
class ImageResultScreen extends StatelessWidget {
  final HomeCubit homeCubit;

  ImageResultScreen({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit, // استخدم homeCubit الممرر
        builder: (context, state) {
          return Column(
            children: [
              if (homeCubit.currencyPhoto != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *.6,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.file(
                        File(homeCubit.currencyPhoto!.path),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xff333333),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  Text(
                  '1 Pound, 0.5 Pound',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
