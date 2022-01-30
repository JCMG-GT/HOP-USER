import 'package:flutter/material.dart';

import 'package:hopapp/src/config/app_colors.dart';

import 'package:hopapp/src/pages/widgets/widgets.dart';

class SubtabPromos extends StatelessWidget {
  const SubtabPromos({
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
          _ItemPromo(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            promo: '50% off cover from 8:00 - 9:00 pm',
          ),
          Divider(),
          _ItemPromo(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            promo: '50% off cover from 8:00 - 9:00 pm',
          ),
          Divider(),
          _ItemPromo(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            promo: '50% off cover from 8:00 - 9:00 pm',
          ),
          Divider(),
          _ItemPromo(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            promo: '50% off cover from 8:00 - 9:00 pm',
          ),
          Divider(),
          _ItemPromo(
            title: 'Carpentr\'s Bar',
            imageUrl: 'https://img.lovepik.com/photo/50086/2824.jpg_wh860.jpg',
            promo: '50% off cover from 8:00 - 9:00 pm',
          ),
        ],
      ),
    );
  }
}

class _ItemPromo extends StatelessWidget {
  const _ItemPromo({
    required this.title,
    required this.promo,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final String promo;

  @override
  Widget build(BuildContext context) {
    final _itemAddress = Text(
      promo,
      style: TextStyle(
        fontSize: 16,
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
            Expanded(
                child: BarInfoBox(
                    name: title, imagePath: imageUrl, address: promo)),
            Icon(Icons.navigate_next_rounded),
          ],
        ),
      ),
    );
  }
}
