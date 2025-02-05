
import 'package:flutter/cupertino.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';

class tabwidghtDesign extends StatelessWidget {
  final bool isSelected;
  final String evenname;

  tabwidghtDesign({required this.isSelected, required this.evenname});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height*0.008,horizontal: width*0.05),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellocolor : AppColors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.yellocolor,
          width: 2,
        ),
      ),
      child: Text(
        evenname,
        style: isSelected
            ? Fontspath.w700Inter20(color: AppColors.blackcolor)
            : Fontspath.w700Inter20(color: AppColors.yellocolor),
      ),
    );
  }
}
