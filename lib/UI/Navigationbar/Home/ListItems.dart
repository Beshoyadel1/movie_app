import 'package:flutter/cupertino.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class ListItems extends StatelessWidget {
  String rate,PathImage;
  ListItems({required this.PathImage,required this.rate});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            PathImage,
            width: width*0.3,
            height: height*0.2, // Adjust height
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding:  EdgeInsets.symmetric(horizontal:height*0.01, vertical: width*0.008),
          margin:  EdgeInsets.symmetric(horizontal:height*0.005, vertical: width*0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.blackcolor.withOpacity(0.71),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(rate,style: Fontspath.w400Inter14(color: AppColors.whitecolor),),
              SizedBox(
                width: width*0.02,
              ),
              Image.asset(ImagePath.star),
            ],
          ),
        )
      ],
    );
  }
}
