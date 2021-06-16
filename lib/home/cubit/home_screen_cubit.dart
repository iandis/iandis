import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

import '/constants/app_urls.dart';
import '/repositories/screen_utils_repo/screen_utils_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final ScreenUtilsRepo screenUtilsRepo;
  HomeScreenCubit({required this.screenUtilsRepo}) : super(HomeScreenState.init());

  void openLinkedIn() async {
    if(await canLaunch(AppUrls.linkedIn)){
      await launch(AppUrls.linkedIn);
    }else{
      screenUtilsRepo.showMessageDialog(
        message: 'I\'m sorry there\'s something wrong when trying to open up my LinkedIn profile :(',
        dialogType: DialogType.error,
      );
    }
  }

  void openGitHub() async {
    if(await canLaunch(AppUrls.githubRepository)){
      await launch(AppUrls.githubRepository);
    } else {
      screenUtilsRepo.showMessageDialog(
        message:
            'I\'m sorry there\'s something wrong when trying to open up my GitHub repo :(',
        dialogType: DialogType.error,
      );
    }
  }

  void openEmail() {
    final _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'iandisantulusn@gmail.com',
      queryParameters: {'subject': 'Hi'}
    );
    launch(_emailLaunchUri.toString());
  }
}
