// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
// import 'package:flutter_bmflocation/flutter_baidu_location.dart';
// import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
// import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';

// class MapComponent extends StatefulWidget {
//   MapComponent({Key key}) : super(key: key);

//   @override
//   _MapComponentState createState() => _MapComponentState();
// }

// class _MapComponentState extends State<MapComponent> {
//   Map<String, Object> _loationResult;
//   BaiduLocation _baiduLocation;

//   StreamSubscription<Map<String, Object>> _locationListener;

//   LocationFlutterPlugin _locationPlugin = new LocationFlutterPlugin();

//   @override
//   void initState() {
//     super.initState();

//     _locationPlugin.requestPermission();
//     //动态申请定位权限

//     //设置iOS端AK, Android端AK可以直接在清单文件中配置
//     LocationFlutterPlugin.setApiKey("g8h2IvFkIDn3fTkbRsDbKtqKWfX8btgM");

//     _locationListener = _locationPlugin.onResultCallback().listen((Map<String, Object> result) {
//       setState(() {
//         _loationResult = result;
//         try {
//           _baiduLocation = BaiduLocation.fromMap(result);
//           // print(_baiduLocation);
//         } catch (e) {
//           print(e);
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     if (null != _locationListener) {
//       _locationListener.cancel();
//     }
//   }

//   /// 设置android端和ios端定位参数
//   // void _setLocOption() {
//   //   /// android 端设置定位参数
//   //   BaiduLocationAndroidOption androidOption = new BaiduLocationAndroidOption();
//   //   androidOption.setCoorType("bd09ll"); // 设置返回的位置坐标系类型
//   //   androidOption.setIsNeedAltitude(true); // 设置是否需要返回海拔高度信息
//   //   androidOption.setIsNeedAddres(true); // 设置是否需要返回地址信息
//   //   androidOption.setIsNeedLocationPoiList(true); // 设置是否需要返回周边poi信息
//   //   androidOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
//   //   androidOption.setIsNeedLocationDescribe(true); // 设置是否需要返回位置描述
//   //   androidOption.setOpenGps(true); // 设置是否需要使用gps
//   //   androidOption.setLocationMode(LocationMode.Hight_Accuracy); // 设置定位模式
//   //   androidOption.setScanspan(1000); // 设置发起定位请求时间间隔

//   //   Map androidMap = androidOption.getMap();

//   //   /// ios 端设置定位参数
//   //   BaiduLocationIOSOption iosOption = new BaiduLocationIOSOption();
//   //   iosOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
//   //   iosOption.setBMKLocationCoordinateType("BMKLocationCoordinateTypeBMK09LL"); // 设置返回的位置坐标系类型
//   //   iosOption.setActivityType("CLActivityTypeAutomotiveNavigation"); // 设置应用位置类型
//   //   iosOption.setLocationTimeout(10); // 设置位置获取超时时间
//   //   iosOption.setDesiredAccuracy("kCLLocationAccuracyBest"); // 设置预期精度参数
//   //   iosOption.setReGeocodeTimeout(10); // 设置获取地址信息超时时间
//   //   iosOption.setDistanceFilter(100); // 设置定位最小更新距离
//   //   iosOption.setAllowsBackgroundLocationUpdates(true); // 是否允许后台定位
//   //   iosOption.setPauseLocUpdateAutomatically(true); //  定位是否会被系统自动暂停

//   //   Map iosMap = iosOption.getMap();

//   //   _locationPlugin.prepareLoc(androidMap, iosMap);
//   // }

//   // /// 启动定位
//   // void _startLocation() {
//   //   if (null != _locationPlugin) {
//   //     _setLocOption();
//   //     _locationPlugin.startLocation();
//   //   }
//   // }

//   // /// 停止定位
//   // void _stopLocation() {
//   //   if (null != _locationPlugin) {
//   //     _locationPlugin.stopLocation();
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: 400,
//       color: Colors.red,
//       child: null,
//     );
//   }
// }
