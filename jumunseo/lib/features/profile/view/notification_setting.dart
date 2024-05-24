import 'package:jumunseo/core/blank.dart';
import 'package:jumunseo/core/notification.dart';
import 'package:jumunseo/features/wizard/chat/chat.dart';
import 'package:jumunseo/shared/gradient_icon.dart';
import 'package:jumunseo/shared/gradient_switch.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {

  List<Widget> iconList = [const GradientIcon(child: Icon(Icons.alarm))];
  List<String> accountList = ["딜레마 알림",];

  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text("Notification", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(iconList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      iconList[index],
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(accountList[index], style: const TextStyle(color: Colors.grey, fontSize: 12),),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 0.5,
                        child: GradientSwitch(isSwitchOn: isSwitchOn, onChange: (changeValue) {
                          if(changeValue) {
                            FlutterLocalNotification.showNotification();
                          }
                          else {
                            FlutterLocalNotification.cancelNotification();
                          }

                          setState(() => isSwitchOn = changeValue);
                        },),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const Blank(0, 15),
          ],
        ),
      ),
    );
  }
}