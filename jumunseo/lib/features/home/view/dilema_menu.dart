import '../home.dart';
import 'package:jumunseo/core/blank.dart';

class DilemaMenu extends StatelessWidget {
  const DilemaMenu({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: Color.fromARGB(0xff, 0xea, 0xf0, 0xff),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("딜레마 해결 서비스", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),),
            Blank(0, 5),
            Text("D-3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0),),
            Blank(0, 15),
            Row(children: [Spacer(), Text("00명 참여", style: TextStyle(color: Colors.black, fontSize: 10.0),)]),
            Blank(0, 15),
            Center(child: Text("딜레마 주제", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),),),
          ],
        ),
      ),
    );
  }
}