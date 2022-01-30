import 'package:flutter/material.dart';

import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/pages/widgets/widgets.dart';
import 'package:hopapp/src/routes/routes.dart';

class SubtabVenues extends StatelessWidget {
  const SubtabVenues({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 35.0),
          itemCount: 2,
          itemBuilder: (context, index) => Column(
            children: <Widget>[
              Divider(),
              ItemVenue(
                title: 'Carpentr\'s Bar',
                imageUrl:
                    'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
                address: '630 Oxford rd, Ann Arbor, Mi',
                schedule: 'Today, 2:00pm - 2:00am',
                friendsNum: '10',
                lineLength: 'Line Length: 30 minutes - 10:59',
              ),
              Divider(),
              ItemVenue(
                title: 'Carpentr\'s Bar 1',
                imageUrl:
                    'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
                address: '630 Oxford rd, Ann Arbor, Mi',
                schedule: 'Today, 2:00pm - 2:00am',
                friendsNum: '8',
                lineLength: 'Line Length: 30 minutes - 10:59',
              ),
              Divider(),
              ItemVenue(
                title: 'Carpentr\'s Bar 2',
                imageUrl:
                    'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
                address: '630 Oxford rd, Ann Arbor, Mi',
                schedule: 'Today, 2:00pm - 2:00am',
                friendsNum: '5',
                lineLength: 'Line Length: 30 minutes - 10:59',
              ),
              Divider(),
              ItemVenue(
                title: 'Carpentr\'s Bar 3',
                imageUrl:
                    'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
                address: '630 Oxford rd, Ann Arbor, Mi',
                schedule: 'Today, 2:00pm - 2:00am',
                friendsNum: '2',
                lineLength: 'Line Length: 30 minutes - 10:59',
              ),
              Divider(),
              ItemVenue(
                title: 'Carpentr\'s Bar 4',
                imageUrl:
                    'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
                address: '630 Oxford rd, Ann Arbor, Mi',
                schedule: 'Today, 2:00pm - 2:00am',
                friendsNum: '10',
                lineLength: 'Line Length: 30 minutes - 10:59',
              ),
            ],
          ),
        ));
  }
}

class ItemVenue extends StatelessWidget {
  const ItemVenue({
    required this.title,
    required this.address,
    required this.schedule,
    required this.lineLength,
    required this.friendsNum,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String title;
  final String address;
  final String schedule;
  final String lineLength;
  final String friendsNum;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final _itemLineLength = Text(lineLength);

    final _itemFriendsNumber = Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '10',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          maxLines: 1,
          // textScaleFactor: 0.9,
        ),
      ),
    );

    return RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.barHop);
      },
      splashColor: AppColors.primary.withOpacity(0.2),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: BarInfoBox(
                    name: title,
                    imagePath: imageUrl,
                    address: address,
                    schedule: schedule,
                  ),
                ),
                _itemFriendsNumber,
              ],
            ),
            SizedBox(height: 15.0),
            _itemLineLength
          ],
        ),
      ),
    );
  }
}
