import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class widget_screen_onboarding extends StatelessWidget {
  String background,firstTitle,description,first_button,second_button,screenview_next;
   String screenview_back;
    Color? colorbackground;
  widget_screen_onboarding(
    {required this.description,required this.background,
     required this.first_button, required this.firstTitle,
     required this.second_button,required this.screenview_next,this.colorbackground, required this.screenview_back
    });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            colorbackground != null?
            Container(
              // Semi-transparent black background
              padding: EdgeInsets.symmetric(vertical: height * 0.05, horizontal: width * 0.08),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    firstTitle,
                    style: Fontspath.w700Inter24(color: AppColors.whitecolor),
                    textAlign: TextAlign.center,
                  ),
                  description.isNotEmpty?SizedBox(height: height * 0.02):SizedBox(height: height * 0),
                  Text(
                    description,
                    style: Fontspath.w400Inter20(color: Color(0x99ffffff)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.04),
                  second_button.isNotEmpty?
                  Column(
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
                          Navigator.pushNamed(context,screenview_next);
                        },
                        child: Text(
                          first_button,
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
                              side: BorderSide(
                                  width: 1,
                                  color: AppColors.yellocolor
                              )
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context,screenview_back);
                        },
                        child: Text(
                          second_button,
                          style: Fontspath.w600Inter20(color: AppColors.yellocolor),
                        ),
                      ),
                    ],
                  )
                      :
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                      backgroundColor: AppColors.yellocolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context,screenview_next);
                    },
                    child: Text(
                      first_button,
                      style: Fontspath.w600Inter20(color: AppColors.blackcolor),
                    ),
                  ),
                ],
              ),
            )
                :
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    firstTitle,
                    style: Fontspath.w500Inter36(color: AppColors.whitecolor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    description,
                    style: Fontspath.w400Inter20(color: Color(0x99ffffff)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.04),
                  second_button.isNotEmpty?
                  Column(
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
                          Navigator.pushNamed(context,screenview_next);
                        },
                        child: Text(
                          first_button,
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
                              side: BorderSide(
                                  width: 1,
                                  color: AppColors.yellocolor
                              )
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context,screenview_back);
                        },
                        child: Text(
                          second_button,
                          style: Fontspath.w600Inter20(color: AppColors.yellocolor),
                        ),
                      ),
                    ],
                  )
                      :
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                      backgroundColor: AppColors.yellocolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context,screenview_next);
                    },
                    child: Text(
                      first_button,
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
  }
}
