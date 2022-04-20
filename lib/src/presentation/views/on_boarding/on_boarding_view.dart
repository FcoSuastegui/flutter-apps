import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps/src/presentation/core/utils/responsive.dart';
import 'package:flutter_apps/src/presentation/views/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:flutter_apps/src/presentation/views/on_boarding/widget/on_boarding_content.dart';
import 'package:flutter_apps/src/presentation/views/on_boarding/widget/on_boarding_dot.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = '/on-boarding';
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List colors = [Color.fromARGB(255, 110, 81, 34), Color(0xffFFE5DE), Color(0xffDCF6E6)];
    final responsive = Responsive.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark, //status bar brigtness
      ),
    );

    return BlocProvider(
      create: (context) => OnBoardingCubit(
        pageController: PageController(),
      ),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarBrightness: state.currentePage > 0 ? Brightness.light : Brightness.dark, //status bar brigtness
            ),
          );
        },
        builder: (context, state) {
          final cubit = context.read<OnBoardingCubit>();
          return Scaffold(
            backgroundColor: colors[state.currentePage],
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: cubit.pageViewController,
                    onPageChanged: cubit.nextPage,
                    itemCount: contents.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Image.asset(
                              contents[index].image,
                              height: responsive.blockV() * 35,
                            ),
                            SizedBox(
                              height: (responsive.height >= 840) ? 60 : 30,
                            ),
                            Text(
                              contents[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                color: state.currentePage > 0 ? Colors.black : Colors.white,
                                fontSize: (responsive.width <= 550) ? 30 : 35,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              contents[index].desc,
                              style: TextStyle(
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w300,
                                color: state.currentePage > 0 ? Colors.black : Colors.white,
                                fontSize: (responsive.width <= 550) ? 17 : 25,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (int contentIndex) => OnBoardingDot(
                            currentIndex: contentIndex == state.currentePage,
                            colorDot: state.currentePage > 0 ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1500),
                        child: state.currentePage + 1 == contents.length
                            ? Padding(
                                padding: const EdgeInsets.all(30),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("START"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: (responsive.width <= 550)
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 100,
                                            vertical: 20,
                                          )
                                        : EdgeInsets.symmetric(
                                            horizontal: responsive.width * 0.2,
                                            vertical: 25,
                                          ),
                                    textStyle: TextStyle(
                                      fontSize: (responsive.width <= 550) ? 13 : 17,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        cubit.skipPage();
                                      },
                                      child: Text(
                                        "SKIP",
                                        style: TextStyle(
                                          color: state.currentePage > 0 ? Colors.black : Colors.white,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: (responsive.width <= 550) ? 13 : 17,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        cubit.nextPageButton();
                                      },
                                      child: const Text("NEXT"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        elevation: 0,
                                        padding: (responsive.width <= 550)
                                            ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                                            : const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                                        textStyle: TextStyle(fontSize: (responsive.width <= 550) ? 13 : 17),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
