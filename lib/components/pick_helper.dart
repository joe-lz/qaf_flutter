import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:easy_localization/easy_localization.dart';

// import 'package:percentage_flutter/config/city.dart';
// import 'package:percentage_flutter/kit/util/date_util.dart';
import 'package:qaf_flutter/utils/city_data.dart';

const double _kPickerSheetHeight = 300.0;
const double _kPickerItemHeight = 32.0;

typedef PickerConfirmCityCallback = void Function(List<String> stringData, List<int> selecteds);

class PickHelper {
  ///普通简易选择器
  static void openSimpleDataPicker<T>(
    BuildContext context, {
    @required List<T> list,
    String title,
    @required T value,
    PickerDataAdapter adapter,
    @required PickerConfirmCallback onConfirm,
  }) {
    var incomeIndex = 0;
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        if (list[i] == value) {
          incomeIndex = i;
          break;
        }
      }
    }
    openModalPicker(
      context,
      reversedOrder: false,
      adapter: adapter ??
          PickerDataAdapter(
            pickerdata: list,
            isArray: false,
          ),
      onConfirm: onConfirm,
      selecteds: [incomeIndex],
      title: title,
    );
  }

  ///数字选择器
  static void openNumberPicker(
    BuildContext context, {
    String title,
    List<NumberPickerColumn> datas,
    NumberPickerAdapter adapter,
    @required PickerConfirmCallback onConfirm,
    bool reversedOrder,
    List<int> selecteds,
  }) {
    openModalPicker(
      context,
      adapter: adapter ?? NumberPickerAdapter(data: datas ?? []),
      title: title,
      onConfirm: onConfirm,
      reversedOrder: reversedOrder,
      selecteds: selecteds,
    );
  }

  ///日期选择器
  // static void openDateTimePicker(
  //   BuildContext context, {
  //   String title,
  //   DateTime maxValue,
  //   DateTime minValue,
  //   DateTime value,
  //   DateTimePickerAdapter adapter,
  //   @required PickerConfirmCallback onConfirm,
  // }) {
  //   openModalPicker(context,
  //       adapter: adapter ??
  //           DateTimePickerAdapter(
  //               type: PickerDateTimeType.kYMD,
  //               isNumberMonth: true,
  //               yearSuffix: "年",
  //               maxValue: maxValue ?? DateUtil.after(year: 20),
  //               minValue: minValue ?? DateUtil.before(year: 100),
  //               value: value ?? DateTime.now(),
  //               monthSuffix: "月",
  //               daySuffix: "日"),
  //       title: title,
  //       onConfirm: onConfirm);
  // }

  ///地址选择器
  static final CityDataJSON = JsonDecoder().convert(CityData);
  static void openCityPicker(
    BuildContext context, {
    String title,
    @required PickerConfirmCityCallback onConfirm,
    String selectCity = "",
  }) {
    var proIndex = 0;
    var cityIndex = 0;
    List<PickerItem<dynamic>> cityList = List<PickerItem<dynamic>>.from(
      CityDataJSON.asMap().keys.map((provincePos) {
        var province = CityDataJSON[provincePos];
        List citys = province['city'];
        return PickerItem(
          text: Text(
            province['name'],
            style: Theme.of(context).textTheme.headline6,
          ),
          value: province['name'],
          children: citys.asMap().keys.map((cityPos) {
            var city = citys[cityPos];
            if (city['name'] == selectCity) {
              proIndex = provincePos;
              cityIndex = cityPos;
            }
            return PickerItem(
                text: Text(
              city['name'],
              style: Theme.of(context).textTheme.headline6,
            ));
          }).toList(),
        );
      }).toList(),
    );
    openModalPicker(
      context,
      adapter: PickerDataAdapter(
        data: cityList,
      ),
      title: title,
      onConfirm: (pick, value) {
        var p = CityDataJSON[value[0]];
        List citys = p['city'];
        onConfirm([p['name'], citys[value[1]]['name']], value);
      },
      selecteds: [proIndex, cityIndex],
    );
  }

  static void openModalPicker(
    BuildContext context, {
    @required PickerAdapter adapter,
    String title,
    List<int> selecteds,
    @required PickerConfirmCallback onConfirm,
    bool reversedOrder = false,
  }) {
    new Picker(
      adapter: adapter,
      title: new Text(
        title ?? "",
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).textTheme.caption.color,
          fontWeight: FontWeight.w500,
        ),
      ),
      selecteds: selecteds,
      cancelText: 'actions.cancel'.tr(),
      confirmText: 'actions.confirm'.tr(),
      cancelTextStyle: Theme.of(context).textTheme.bodyText1,
      confirmTextStyle: Theme.of(context).textTheme.bodyText1,
      textAlign: TextAlign.right,
      itemExtent: _kPickerItemHeight,
      height: _kPickerSheetHeight,
      selectedTextStyle: Theme.of(context).textTheme.headline6,
      textStyle: Theme.of(context).textTheme.headline6,
      onConfirm: onConfirm,
      reversedOrder: reversedOrder,
      backgroundColor: Theme.of(context).canvasColor,
      headercolor: Theme.of(context).canvasColor,
    ).showModal(context);
  }
}
