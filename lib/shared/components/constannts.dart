
//void signOut(BuildContext context) {
//  CacheHelper.sharedPreferences!.remove('token').then((value) {
//    if (value) {
//      navigateAndFinish(context, SocialLoginScreen());
//    }
//  });
//}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) {
    print(element.group(0));
  });
}

String token='';