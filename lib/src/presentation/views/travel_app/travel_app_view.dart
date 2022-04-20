import 'package:flutter/material.dart';
import 'package:flutter_apps/src/presentation/core/routes/router.dart';
import 'package:flutter_apps/src/presentation/views/travel_app/themes/theme.dart';
import 'package:flutter_apps/src/presentation/views/travel_app/travel_app_detail_view.dart';

class TravelAppView extends StatelessWidget {
  static const String routeName = '/travel-app';
  const TravelAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: const [
            _MainPage(),
            _BottomNav(),
          ],
        ),
      ),
    );
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _MainHeader(),
        _MainVacations(),
        _MainCountries(),
        _MainGoinEvent(),
        SizedBox(height: 100),
      ],
    );
  }
}

class _MainHeader extends StatelessWidget {
  const _MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
        bottom: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            // image
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travelapp/images/user.png'),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo Haikal,',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Good morning',
                  style: whiteTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ]),
          // search
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/travelapp/images/icon_search.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MainVacations extends StatelessWidget {
  const _MainVacations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let’s enjoy your \nVacation',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 39),
                  child: Column(
                    children: [
                      Text(
                        'All',
                        style: yellowTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 2,
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 39),
                  child: Text(
                    'Asia',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 39),
                  child: Text(
                    'America',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 39),
                  child: Text(
                    'Africe',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 39),
                  child: Text(
                    'Europe',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 39),
                  child: Text(
                    'North',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainCountries extends StatelessWidget {
  const _MainCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.of(context);
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 35,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Countries',
                style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              Text(
                'See All',
                style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    router.push(const TravelAppDetailView());
                  },
                  child: Container(
                    width: 120,
                    height: 170,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(defaultBorder),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              // width: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/travelapp/images/bali.png'),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 64,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(defaultBorder),
                                    bottomLeft: const Radius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/travelapp/images/icon_star.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 11),
                          child: Center(
                              child: Text(
                            'Bali',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 170,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(defaultBorder),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            // width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/travelapp/images/paris.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        child: Center(
                            child: Text(
                          'Paris',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  height: 170,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(defaultBorder),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(defaultBorder),
                                topRight: Radius.circular(
                                  defaultBorder,
                                ),
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/travelapp/images/england.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        child: Center(
                            child: Text(
                          'England',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MainGoinEvent extends StatelessWidget {
  const _MainGoinEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'On Going Event',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'See All',
                  style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 205,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 230,
                  height: 205,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorder),
                  ),
                  child: Stack(
                    children: [
                      const Image(
                        image: AssetImage('assets/travelapp/images/brazil.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rio Carnival, Rio\nde Janiro',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/travelapp/images/icon_mark.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Brazil',
                                  style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 230,
                  height: 205,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorder),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 230,
                        height: 205,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/travelapp/images/japan.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(defaultBorder),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sapporo Snow\nFestival',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/travelapp/images/icon_mark.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Japan',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: semiBold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 68.0,
        decoration: const BoxDecoration(color: kGreyColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 17.95,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/travelapp/images/icon_home.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Home',
                  style: yellowTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
                ),
              ],
            ),
            Container(
              width: 20.0,
              height: 20.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travelapp/images/icon_notif.png'),
                ),
              ),
            ),
            Container(
              width: 20.0,
              height: 20.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travelapp/images/icon_menu.png'),
                ),
              ),
            ),
            Container(
              width: 20.0,
              height: 20.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travelapp/images/icon_settings.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
