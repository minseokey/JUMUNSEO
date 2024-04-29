String timeDiffString(DateTime dateTime) {
  final Duration dateDiffSec = DateTime.now().difference(dateTime);

  if (dateDiffSec.inSeconds < 60) {
    return "${dateDiffSec.inSeconds}초 전";
  }
  if (dateDiffSec.inMinutes < 60) {
    return "${dateDiffSec.inMinutes}분 전";
  } else if (dateDiffSec.inHours < 24) {
    return "${dateDiffSec.inHours}시간 전";
  } else if (dateDiffSec.inDays < 7) {
    return "${dateDiffSec.inDays}일 전";
  } else if (dateDiffSec.inDays < 30) {
    return "${dateDiffSec.inDays ~/ 7}주 전";
  } else if (dateDiffSec.inDays < 365) {
    return "${dateDiffSec.inDays ~/ 30}달 전";
  } else {
    return "${dateDiffSec.inDays ~/ 365}년 전";
  }
}
