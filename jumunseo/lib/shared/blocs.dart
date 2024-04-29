import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/home/cubit/home_cubit.dart';
import 'package:jumunseo/features/profile/cubit/profile_cubit.dart';
import 'package:jumunseo/features/login/login.dart';
import 'package:jumunseo/features/wizard/chat/chat.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WizardCubit>(
          create: (BuildContext context) => WizardCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(),
        ),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
      ],
      child: child,
    );
  }
}
