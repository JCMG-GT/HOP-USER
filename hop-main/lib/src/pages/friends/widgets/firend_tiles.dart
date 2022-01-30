part of 'widgets_friends.dart';

class FriendRequestTile extends StatelessWidget {
  const FriendRequestTile({
    Key? key,
    required this.name,
    required this.nickName,
    this.imageUrl =
        'https://png.pngtree.com/element_our/20190604/ourmid/pngtree-user-avatar-boy-image_1482937.jpg',
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final String nickName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
          leading: CircleAvatar(
            maxRadius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          subtitle: Text(
            nickName,
            style: TextStyle(fontSize: 14.0),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                splashColor: Colors.red.withOpacity(0.5),
                splashRadius: 20.0,
                icon: Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              IconButton(
                splashColor: AppColors.primary.withOpacity(0.5),
                splashRadius: 20.0,
                icon: Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
