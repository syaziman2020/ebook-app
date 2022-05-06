import 'package:bloc/bloc.dart';

class CurrentPageCubit extends Cubit<int> {
  CurrentPageCubit() : super(1);

  void changePage(int index) {
    emit(index);
  }
}
