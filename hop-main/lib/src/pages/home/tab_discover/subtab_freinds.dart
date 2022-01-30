import 'package:flutter/material.dart';
import 'package:hopapp/src/config/app_colors.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

class SubtabFriends extends StatelessWidget {
  const SubtabFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30.0),
      itemCount: 2,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          Divider(),
          _ItemFirends(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            friendsNum: '10',
          ),
          Divider(),
          _ItemFirends(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            friendsNum: '8',
          ),
          Divider(),
          _ItemFirends(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            friendsNum: '2',
          ),
          Divider(),
          _ItemFirends(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            friendsNum: '5',
          ),
          Divider(),
          _ItemFirends(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            friendsNum: '10',
          ),
        ],
      ),
    );
  }
}

class _ItemFirends extends StatelessWidget {
  const _ItemFirends({
    required this.title,
    required this.imageUrl,
    required this.friendsNum,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final String friendsNum;

  @override
  Widget build(BuildContext context) {
    final _itemFriendsNumber = Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          friendsNum,
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
      onPressed: () {},
      splashColor: AppColors.primary.withOpacity(0.2),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(child: BarInfoBox(name: title, imagePath: imageUrl)),
            _itemFriendsNumber,
            Icon(Icons.navigate_next_rounded),
          ],
        ),
      ),
    );
  }
}
