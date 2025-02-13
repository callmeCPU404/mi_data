import 'package:flutter/material.dart';
import 'package:mi_data/screens/homescreen/homescreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';


class OnboardingScreen extends StatefulWidget {
  

  const OnboardingScreen({super.key,});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/welcome_farmers.png',
    'assets/chickenpre.png',
    'assets/sync.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF50B97B);
    

    final List<String> textTitles = [
     'Discover Open-Source Projects',
      'Save & Access Offline',
       'Organize with Ease',
    ];

    final List<String> texts = [
       'Explore thousands of GitHub repositories and stay updated with the latest projects.!',
       'Fetch repository details and store them locally for offline viewing anytime.',
      'Save, view, and delete repositories effortlessly with a user-friendly experience.',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: textTitles.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index],
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        textTitles[index],
                        style: GoogleFonts.actor(
                          color: customColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          texts[index],
                          style: GoogleFonts.actor(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: textTitles.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.green,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 16,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (_currentPage == images.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
                child: Container(
                  decoration: BoxDecoration(
                    color: customColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      _currentPage == images.length - 1
                          ?  'Get Started'
                          :  'Next',
                      style: GoogleFonts.actor(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}