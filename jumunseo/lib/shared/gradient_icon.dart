import 'package:jumunseo/config/theme/app_color.dart';
import 'package:jumunseo/features/home/home.dart';

class GradientIcon extends StatelessWidget {
  final Widget child;

  const GradientIcon({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => const RadialGradient(
        center: Alignment.topCenter,
        stops: [.5, 1],
        colors: [
          ColorStyles.mainColor,
          ColorStyles.secondMainColor,
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}