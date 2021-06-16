import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iandis/models/certificate_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '/constants/app_urls.dart';
import '/repositories/screen_utils_repo/screen_utils_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final ScreenUtilsRepo screenUtilsRepo;
  HomeScreenCubit({required this.screenUtilsRepo}) : super(HomeScreenState.init());

  void openLinkedIn({bool test = false}) async {
    if(await canLaunch(AppUrls.linkedIn) && !test){
      await launch(AppUrls.linkedIn);
    }else{
      screenUtilsRepo.showMessageDialog(
        message: 'I\'m sorry there\'s something wrong when trying to open up my LinkedIn profile :(',
        dialogType: DialogType.error,
      );
    }
  }

  void openGitHub({bool test = false}) async {
    if(await canLaunch(AppUrls.githubRepository) && !test){
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

  void openCertificateUrl(int index, {bool test = false}) async {
    if(await canLaunch(state.certificates[index].url) && !test){
      await launch(state.certificates[index].url);
    } else {
      screenUtilsRepo.showMessageDialog(
        message:
            'I\'m sorry there\'s something wrong when trying to open up my certificate credential :(',
        dialogType: DialogType.error,
      );
    }
  }
}
