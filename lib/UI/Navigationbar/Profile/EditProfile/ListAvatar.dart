import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/ImagePath.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';

class ListAvatar extends StatelessWidget {
  const ListAvatar({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      ImagePath.face1,
      ImagePath.face2,
      ImagePath.face3,
      ImagePath.face4,
      ImagePath.face5,
      ImagePath.face6,
      ImagePath.face7,
      ImagePath.face8,
      ImagePath.face9,
    ];

    return Scaffold(
      backgroundColor: AppColors.graycolor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (rowIndex) {
              return SingleChildScrollView(
                scrollDirection:Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (colIndex) {
                    int index = rowIndex * 3 + colIndex;
                    return BlocBuilder<DataProfileBloc, DataProfileState>(
                      builder: (context, state) {
                        String selectedImage = state is ProfileUpdated
                            ? state.selectedImage
                            : '';
                        return InkWell(
                          onTap: () {
                            context.read<DataProfileBloc>().add(UpdateImage(images[index]));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedImage == images[index]
                                  ? AppColors.yellocolor.withOpacity(0.59)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.yellocolor,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(images[index]),
                          ),
                        );
                      },
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
