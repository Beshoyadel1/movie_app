import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__bloc.dart';
import 'package:movie_app/bloc/OnboardingBloc/onboarding__state.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class WidgetScreenOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(state.background),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                state.colorbackground != null
                    ? Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                    horizontal: width * 0.08,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        state.firstTitle,
                        style: Fontspath.w700Inter24(color: AppColors.whitecolor),
                        textAlign: TextAlign.center,
                      ),
                      state.description.isNotEmpty
                          ? SizedBox(height: height * 0.02)
                          : SizedBox(height: height * 0),
                      Text(
                        state.description,
                        style: Fontspath.w400Inter20(color: Color(0x99ffffff)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.04),
                      state.secondButton.isNotEmpty
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              backgroundColor: AppColors.yellocolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, state.screenviewNext);
                            },
                            child: Text(
                              state.firstButton,
                              style: Fontspath.w600Inter20(color: AppColors.blackcolor),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              backgroundColor: AppColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(width: 1, color: AppColors.yellocolor),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, state.screenviewBack);
                            },
                            child: Text(
                              state.secondButton,
                              style: Fontspath.w600Inter20(color: AppColors.yellocolor),
                            ),
                          ),
                        ],
                      )
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: AppColors.yellocolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, state.screenviewNext);
                        },
                        child: Text(
                          state.firstButton,
                          style: Fontspath.w600Inter20(color: AppColors.blackcolor),
                        ),
                      ),
                    ],
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        state.firstTitle,
                        style: Fontspath.w500Inter36(color: AppColors.whitecolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        state.description,
                        style: Fontspath.w400Inter20(color: Color(0x99ffffff)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.04),
                      state.secondButton.isNotEmpty
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              backgroundColor: AppColors.yellocolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, state.screenviewNext);
                            },
                            child: Text(
                              state.firstButton,
                              style: Fontspath.w600Inter20(color: AppColors.blackcolor),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              backgroundColor: AppColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(width: 1, color: AppColors.yellocolor),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, state.screenviewBack);
                            },
                            child: Text(
                              state.secondButton,
                              style: Fontspath.w600Inter20(color: AppColors.yellocolor),
                            ),
                          ),
                        ],
                      )
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: AppColors.yellocolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, state.screenviewNext);
                        },
                        child: Text(
                          state.firstButton,
                          style: Fontspath.w600Inter20(color: AppColors.blackcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
