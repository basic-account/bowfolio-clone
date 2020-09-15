import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bowfolio/models/tabs.dart';

class TabsCubit extends Cubit<Tabs> {
  TabsCubit() : super(Tabs.home);

  void updateTab(Tabs tab) => emit(tab);

}