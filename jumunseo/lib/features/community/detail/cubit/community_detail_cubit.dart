import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/community_detail_model.dart';

part 'community_detail_state.dart';

class CommunityDetailCubit extends Cubit<CommunityDetailState> {
  CommunityDetailCubit() : super(const CommunityDetailState());
}
