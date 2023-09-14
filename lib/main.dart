import 'package:flutter/material.dart';
import 'package:mini_1/Data/dimensions.dart';
import 'package:mini_1/Pages/IntroductionPage/slide1.dart';
import 'package:mini_1/Pages/IntroductionPage/slide2.dart';
import 'package:mini_1/Pages/IntroductionPage/slide3.dart';
import 'package:mini_1/Pages/IntroductionPage/slide4.dart';
import 'package:mini_1/Pages/LoginandSignInPage/loginPage.dart';
import 'package:mini_1/Pages/MyPage2.dart';
import 'package:mini_1/Widgets/LongRoundedButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionSlider(),
    );
  }
}

class IntroductionSlider extends StatefulWidget {
  @override
  _IntroductionSliderState createState() => _IntroductionSliderState();
}

class _IntroductionSliderState extends State<IntroductionSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> slides = [
    "Slide 1"
        "Slide 2",
    "Slide 3",
    "Slide 4",
  ];

  void onPreviousPressed() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onNextPressed() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void onStartPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) {
        return loginScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // LinearProgressIndicator(
          //   value: (_currentPage + 1) / slides.length,
          //   backgroundColor: Colors.grey,
          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          // ),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: slides.length + 1,
              itemBuilder: (context, index) {
                // return Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Center(
                //     child: Text(
                //       slides[index],
                //       style: TextStyle(fontSize: 24.0),
                //     ),
                //   ),
                // );
                if (index == 0) {
                  return slide1();
                } else if (index == 1) {
                  return slide2();
                } else if (index == 2) {
                  return slide3();
                } else if (index == 3) {
                  return slide4();
                }
              },
              onPageChanged: (index) {
                setState(() {
                  print(slides.length);
                  _currentPage = index;
                  print(_currentPage);
                });
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            // color: Colors.red,
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: slides.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 70.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: index == _currentPage
                            ? Colors.blue
                            : Colors.blue.withOpacity(0.4),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              // if (_currentPage > 0)
              //   if (_currentPage == slides.length) ...[
              //     longRoundBtn(
              //       text: 'Previous',
              //       width: getDimensionWidth(context) * (3 / 8),
              //       onPressed: onPreviousPressed,
              //     ),
              //     longRoundBtn(
              //         text: 'Start',
              //         width: getDimensionWidth(context) * (3 / 8),
              //         onPressed: onStartPressed)
              //   ] else
              //     longRoundBtn(
              //       text: 'Previous',
              //       width: getDimensionWidth(context) * (3 / 8),
              //       onPressed: () {
              //         onPreviousPressed();
              //       },
              //     ),
              // // ElevatedButton(
              // //   onPressed: () {
              // //     _pageController.previousPage(
              // //       duration: Duration(milliseconds: 500),
              // //       curve: Curves.ease,
              // //     );
              // //   },
              // //   child: Text("Previous"),
              // // ),
              // if (_currentPage < slides.length - 1)
              //   // ElevatedButton(
              //   //   onPressed: () {
              //   //     _pageController.nextPage(
              //   //       duration: Duration(milliseconds: 500),
              //   //       curve: Curves.ease,
              //   //     );
              //   //   },
              //   //   child: Text("Next"),
              //   // ),
              //   if (_currentPage == 0)
              //     longRoundBtn(
              //       text: 'Next',
              //       width: getDimensionWidth(context) * (3 / 4),
              //       onPressed: onNextPressed,
              //     )
              //   else
              //     longRoundBtn(
              //       text: 'Next',
              //       width: getDimensionWidth(context) * (3 / 8),
              //       onPressed: onNextPressed,
              //     )
              if (_currentPage == 0) ...[
                longRoundBtn(
                    text: "Next",
                    width: getDimensionWidth(context) * (3 / 4),
                    onPressed: onNextPressed)
              ] else if (_currentPage > 0 && _currentPage < slides.length) ...[
                longRoundBtn(
                    text: "Previous",
                    width: getDimensionWidth(context) * (3 / 8),
                    onPressed: onPreviousPressed),
                longRoundBtn(
                    text: "Next",
                    width: getDimensionWidth(context) * (3 / 8),
                    onPressed: onNextPressed)
              ] else if (_currentPage == 3) ...[
                longRoundBtn(
                    text: "Previous",
                    width: getDimensionWidth(context) * (3 / 8),
                    onPressed: onPreviousPressed),
                longRoundBtn(
                    text: "Start",
                    width: getDimensionWidth(context) * (3 / 8),
                    onPressed: onStartPressed)
              ]
            ],
          ),
        ],
      ),
    );
  }
}
