import 'package:flutter/cupertino.dart';
import 'package:movie_app/assets/ImagePath.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.onboarding6),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
