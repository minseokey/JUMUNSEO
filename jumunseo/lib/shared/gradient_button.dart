import '../features/wizard/chat/chat.dart';
import 'package:jumunseo/config/theme/app_color.dart';

class GradientButton extends StatelessWidget {
  final Widget child;

  const GradientButton({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorStyles.mainColor,
            ColorStyles.secondMainColor,
          ],
        ),
      ),
      child: Center(child: child)
    );
  }
}