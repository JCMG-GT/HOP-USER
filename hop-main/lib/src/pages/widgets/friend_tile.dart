part of 'widgets.dart';

class FirendTile extends StatelessWidget {
  const FirendTile(
      {required this.name,
      this.imagePath =
          'https://png.pngtree.com/element_our/20190604/ourmid/pngtree-user-avatar-boy-image_1482937.jpg',
      Key? key})
      : super(key: key);

  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 30,
        backgroundImage: NetworkImage(imagePath),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      selectedTileColor: Colors.teal,
      onTap: () {
        print('object');
      },
    );
  }
}
