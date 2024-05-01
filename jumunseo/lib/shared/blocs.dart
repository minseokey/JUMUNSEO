import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider<WizardCubit>(
          create: (BuildContext context) => WizardCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocListener(listener: (context, state) {
          if (state is DilemmaCategoryState) {
            if (state.status == DilemmaCategoryStatus.loading) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CircularProgressIndicator();
                },
              );
              context.read<DilemmaCategoryBloc>().add(DilemmaCategoryLoaded());
            }
          }
        }),
      ],
      child: child,
    );
  }
}
