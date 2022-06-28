// @dart=2.9
// ignore_for_file: prefer_const_constructors, missing_return

import 'package:cozy/models/city.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/providers/space_providers.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/bottom_navbar_item.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/space_card.dart';
import 'package:cozy/models/space.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari Kos kosan yang Cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // popular cities
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kota Populer',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 1,
                        name: 'Pontianak',
                        imageUrl: 'assets/city1.png',
                        isPopular: true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: false),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/city3.png',
                        isPopular: false),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Rekomendasi Kos Kosan',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                  future: spaceProvider.getRecomendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                          children: data.map((item) {
                        int index = 0;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Petunjuk',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(children: [
                TipsCard(Tips(
                    id: 1,
                    imageUrl: 'assets/tips1.png',
                    title: 'City GuideLines',
                    updatedAt: '17 April 2022')),
                SizedBox(
                  height: 16,
                ),
                TipsCard(Tips(
                    id: 1,
                    imageUrl: 'assets/tips2.png',
                    title: 'Pontianak FairShip',
                    updatedAt: '15 April 2022')),
              ]),
            ),
            SizedBox(
              height: 70 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/Icon_home_solid.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_mail_solid.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_card_solid.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_love_solid.png',
              isActive: true,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
