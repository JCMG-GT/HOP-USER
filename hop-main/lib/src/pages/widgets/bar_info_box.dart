part of 'widgets.dart';

class BarInfoBox extends StatelessWidget {
  const BarInfoBox(
      {Key? key,
      required this.name,
      required this.imagePath,
      this.address = '',
      this.schedule = ''})
      : super(key: key);

  final String imagePath, name;
  final String? schedule, address;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (address!.isNotEmpty)
                    Text(
                      address!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  if (schedule!.isNotEmpty)
                    Text(
                      schedule!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
