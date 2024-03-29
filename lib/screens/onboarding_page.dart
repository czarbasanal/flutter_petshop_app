import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_petshop_app/app_styles.dart';
import 'package:flutter_petshop_app/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<String> imgList = [
    'assets/cat.png',
    'assets/dog.jpeg',
    'assets/bird.jpg',
  ];

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 0.85,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: imgList.map((item) {
                  return Center(
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000));
                }).toList(),
              ),
            ],
          ),
          PositionedDirectional(
            top: 424,
            child: Container(
              height: 390,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 42,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Image.asset(
                            _current == entry.key
                                ? 'assets/scroll-circle-selected.png'
                                : 'assets/scroll-circle-unselected.png',
                            width: 16,
                            height: 8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Your One-Stop Pet Shop Experience!',
                        style: GoogleFonts.poppins(
                            fontSize: 24, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFFA1A1A1)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: goldYellow,
                          minimumSize: const Size(367, 53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
