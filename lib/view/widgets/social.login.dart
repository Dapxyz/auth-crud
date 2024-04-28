import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          alignment: Alignment.center,
          child: const Text(
            '-- Or sign in with --',
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                margin: const EdgeInsets.only(right: 8), // Spasi antara Google dan Facebook
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/images/google.svg',
                  width: 20, 
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                margin: const EdgeInsets.symmetric(horizontal: 8), // Spasi antara Facebook dan Twitter
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/images/Facebook.svg',
                  width: 20, 
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                margin: const EdgeInsets.only(left: 8), // Spasi antara Facebook dan Twitter
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/images/Twitter.svg',
                  width: 20, 
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
