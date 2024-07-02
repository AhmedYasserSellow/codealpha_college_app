import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/home/data/repos/home_repo_impl.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int isLoggedIn = 0;
  late StudentModelWithPassword studentModel;

  int pageIndex = 0;
  Future loadData() async {
    emit(HomeLoading());
    await HomeRepoImpl().loadData(isLoggedIn, studentModel);
    emit(HomeLoaded());
  }

  void changePages(int index) {
    pageIndex = index;
    emit(HomePageUpdated());
  }
}
