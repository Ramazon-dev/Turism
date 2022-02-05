import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'git_state.dart';

class GitCubit extends Cubit<GitState> {
  GitCubit() : super(GitInitial());
}
