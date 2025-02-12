import 'package:flutter/cupertino.dart';
import 'package:movie_app/assets/AppColors.dart';
import 'package:movie_app/assets/Fontspath.dart';
import 'package:movie_app/assets/ImagePath.dart';

class ItemViewMovie extends StatelessWidget {
  String rate,PathImage;
  double widthscreen,heightscreen;
   ItemViewMovie({required this.PathImage,required this.rate,
     required this.heightscreen,required this.widthscreen});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            PathImage,
            width: width*widthscreen,
            height: height*heightscreen,
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
        ),
      ],
    );
  }
}
