import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/features/home/home.dart';
import 'package:jumunseo/features/profile/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  void toSettingView(BuildContext context) {
    context.push('/profile/settings');
  }
}