import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_banner_event.dart';
part 'bloc_banner_state.dart';

class BlocBannerBloc extends Bloc<BlocBannerEvent, BlocBannerState> {
  BlocBannerBloc() : super(BlocBannerInitial());

  @override
  Stream<BlocBannerState> mapEventToState(
    BlocBannerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
