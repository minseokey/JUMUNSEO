import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/shared/gradient_text.dart';

import '../home.dart';
import 'package:jumunseo/core/blank.dart';

class DilemaMenu extends StatelessWidget {
  const DilemaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Color.fromARGB(0xff, 0xea, 0xf0, 0xff),
        ),
        height: 140,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "딜레마 해결 서비스",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              Blank(0, 5),
              Text(
                "종료 20시간 전",
                style: TextStyle(
                    color: ColorStyles.secondMainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              // gradientText("종료 20시간 전", 12.0),
              Blank(0, 15),
              Row(children: [
                Text("오늘의 딜레마",
                    style: TextStyle(color: Colors.black, fontSize: 12.0)),
                Spacer(),
                Text(
                  "32명 참여",
                  style: TextStyle(color: Colors.black, fontSize: 10.0),
                )
              ]),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "개인이 소유한 데이터는 정부에 의해 자동으로 공유되어야 하는가?",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
