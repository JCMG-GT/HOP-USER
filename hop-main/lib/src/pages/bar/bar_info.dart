import 'package:flutter/material.dart';
import 'package:hopapp/src/routes/routes.dart';

class BarInfo extends StatelessWidget {
  const BarInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0).copyWith(
            bottom: 30.0,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Starting at 9:30pm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        'Cover',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        '\$10',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Hop the line',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        '\$60',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0).copyWith(
            bottom: 30.0,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'Line length',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'as of 10:59pm  -  30 minutes',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.becomeVIP);
            },
            child: Text(
              'VIP',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Promos',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Divider(),
        _PromoDetail(),
        Divider(),
        _PromoDetail(),
        SizedBox(height: 25.0),
      ],
    );
  }
}

class _PromoDetail extends StatelessWidget {
  const _PromoDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0)
          .copyWith(left: 30.0, bottom: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comedy Nigth',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '06/17/21',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '5:00pm - 9:00pm',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Five comedians give us a laugh.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '\$10 pitchers throughout the ...',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
