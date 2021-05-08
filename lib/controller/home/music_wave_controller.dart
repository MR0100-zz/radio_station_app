import 'package:get/get.dart';

/// THIS CLASS CONTAINS MUSIC WAVE DATA...
class MusicWaveController extends GetxController {
  /// THIS VARIABLE IS USED TO MANAGE SELECTED WAVE INDEX...
  int selectedWaveIndex = 0;
  selectedWaveIndexUpdate(int value, {bool reInit = false}) {
    selectedWaveIndex = value;
    if (!reInit) update();
  }

  /// THIS VARIABLE STORE STATE WHILE SONG IS PLAYING  OR PAUSE SONG...
  bool isPlayingState = true;
  isPlayingStateUpdate(bool value, {bool reInit = false}) {
    isPlayingState = value;
    if (!reInit) update();
  }

  /// THIS METHOD IS USED TO MAKE WAVES WORKING AND UPDATES...
  startSong() async {
    await Future.delayed(Duration(milliseconds: 600));
    if (this.selectedWaveIndex >= 60) {
      this.isPlayingStateUpdate(false);
      this.selectedWaveIndexUpdate(0);
    }
    if (this.isPlayingState) {
      this.selectedWaveIndexUpdate(this.selectedWaveIndex + 1);
      update();
    }
  }

  /// THIS FUNCTION IS USED TO FORWARD SONG...
  seekForward() {
    int seekSeconds = 5;
    if (this.selectedWaveIndex >= 55) {
      this.selectedWaveIndex = 60;
    } else {
      this.selectedWaveIndex = this.selectedWaveIndex + seekSeconds;
    }
  }

  /// THIS FUNCTION IS USED TO REWIND SONG...
  seekBackword() {
    int seekSeconds = 5;
    if (this.selectedWaveIndex <= 5) {
      this.selectedWaveIndex = 0;
    } else {
      this.selectedWaveIndex = this.selectedWaveIndex - seekSeconds;
    }
  }

  /// THIS FUNCTION IS USED TO HANDLE PLAY AND PAUSE EVENT...
  playPauseState() {
    this.isPlayingStateUpdate(!this.isPlayingState);
  }
}
