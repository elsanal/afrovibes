import 'package:afromuse/pages/Homebody/Homepage.dart';
import 'package:afromuse/staticValues/valueNotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  Preferences();
  // there are automatic setting
  autoSavePlayerCurrentInfo()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTapedToPlay', isTapedToPlay.value);
    await prefs.setBool('isPlaying', isPlaying.value);
    await prefs.setInt('currentSongIndex', currentSongIndex.value);
    await prefs.setInt('pageCurrentIndex', pageCurrentIndex.value);
    await prefs.setBool('playerToggleNotifier', playerToggleNotifier.value);
    print("All have been saved");
    return true;
  }

//// save list position
  saveScrollPosition(String key, int value)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

//// save list position
  Future<int> readScrollPosition(String key)async{
    final prefs = await SharedPreferences.getInstance();
    int value  =  prefs.getInt(key);
    return value;
  }


//////// Read data from preference

  readDataPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    isTapedToPlay.value = prefs.getBool('isTapedToPlay')??false;
    isPlaying.value = prefs.getBool('isPlaying')??false;
    currentSongIndex.value = prefs.getInt('currentSongIndex')??0;
    pageCurrentIndex.value = prefs.getInt('pageCurrentIndex')??0;
    playerToggleNotifier.value = prefs.getBool('playerToggleNotifier')??false;
    appBarTitleFunc(pageCurrentIndex.value);
    print("Values");
    print(isTapedToPlay.value);
    print(isTapedToPlay.value);
    print(isPlaying.value);
    print(currentSongIndex.value);
    print(pageCurrentIndex.value);
    print("All restored");

  }

}
