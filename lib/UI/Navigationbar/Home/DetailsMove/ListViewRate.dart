import 'package:flutter/cupertino.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class ListViewRate extends StatelessWidget {
  String PathImage;
  String value;
   ListViewRate({required this.PathImage,required this.value});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding:  EdgeInsets.symmetric(horizontal:height*0.02, vertical: width*0.025),
      margin:  EdgeInsets.symmetric(horizontal:height*0.005, vertical: width*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.graycolor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(PathImage),
          SizedBox(
            width: width*0.04,
          ),
          Text(value,style: Fontspath.w700Inter24(color: AppColors.whitecolor),),
        ],
      ),
    );
  }
}
