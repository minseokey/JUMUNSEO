import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumunseo/features/community/cubit/community_cubit.dart';
import 'package:jumunseo/features/dilemma/category/bloc/dilemma_category_bloc.dart';
import 'package:jumunseo/features/dilemma/chat/bloc/dilemma_chat_bloc.dart';
import 'package:jumunseo/features/home/cubit/home_cubit.dart';
import 'package:jumunseo/features/wizard/chat/chat.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider<WizardCubit>(
          create: (BuildContext context) => WizardCubit(),
        ),
        BlocProvider<DilemmaCategoryBloc>(
          create: (context) {
            return DilemmaCategoryBloc();
          },
        ),
        BlocProvider<CommunityCubit>(
          create: (BuildContext context) => CommunityCubit(),
        ),
      ],
      child: child,
    );
  }
}
