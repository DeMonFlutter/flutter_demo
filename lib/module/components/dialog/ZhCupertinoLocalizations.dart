import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// @author DeMon
/// Created on 2020/5/26.
/// E-mail 757454343@qq.com
/// Desc:
class _ZhCupertinoLocalizations extends LocalizationsDelegate<CupertinoLocalizations> {
  const _ZhCupertinoLocalizations();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'zh';

  @override
  Future<CupertinoLocalizations> load(Locale locale) => ZhCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_ZhCupertinoLocalizations old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(zh_CN)';
}

class ZhCupertinoLocalizations implements CupertinoLocalizations {
  const ZhCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    '周一',
    '周二',
    '周三',
    '周四',
    '周五',
    '周六',
    '周日',
  ];

  static const List<String> _shortMonths = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  static const List<String> _months = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString() + "年";

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1] + "月";

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString() + "日";

  @override
  String datePickerHour(int hour) => hour.toString() + "时";

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString() + "时";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0') + '分';

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) return '1 分';
    return minute.toString() + '分';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${date.year}-${_shortMonths[date.month - DateTime.january]}-${date.day.toString()}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_dayPeriod_time;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get todayLabel => '今天';

  @override
  String get alertDialogLabel => 'Alert';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => '时';

  @override
  String timerPickerMinuteLabel(int minute) => '分';

  @override
  String timerPickerSecondLabel(int second) => '秒';

  @override
  String get cutButtonLabel => '剪切';

  @override
  String get copyButtonLabel => '复制';

  @override
  String get pasteButtonLabel => '粘贴';

  @override
  String get selectAllButtonLabel => '全部';

  /// Creates an object that provides US English resource values for the
  /// cupertino library widgets.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(const ZhCupertinoLocalizations());
  }

  /// A [LocalizationsDelegate] that uses [DefaultCupertinoLocalizations.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _ZhCupertinoLocalizations();
}
