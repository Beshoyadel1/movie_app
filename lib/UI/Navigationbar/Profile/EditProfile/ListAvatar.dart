import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/UI/custom%20widget/AvatarList.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';

class ListAvatar extends StatelessWidget {
  const ListAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.graycolor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (rowIndex) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (colIndex) {
                    int index = rowIndex * 3 + colIndex;
                    return BlocBuilder<DataProfileBloc, DataProfileState>(
                      builder: (context, state) {
                        int selectedAvatarId = (state is ProfileUpdated)
                            ? state.avatarId
                            : 0;
                        return InkWell(
                          onTap: () {
                            context.read<DataProfileBloc>().add(UpdateAvatarId(index));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: selectedAvatarId == index
                                  ? AppColors.yellocolor.withOpacity(0.59)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.yellocolor,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(Avatar.avatarImages[index]),
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
