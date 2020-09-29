import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bmflocation/bdmap_location_flutter_plugin.dart';
import 'package:flutter_bmflocation/flutter_baidu_location.dart';
import 'package:flutter_bmfbase/BaiduMap/bmfmap_base.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_android_option.dart';
import 'package:flutter_bmflocation/flutter_baidu_location_ios_option.dart';
import 'package:flutter_bmfmap/BaiduMap/bmfmap_map.dart';
import 'package:flutter_bmfmap/BaiduMap/map/bmf_map_view.dart';

import 'package:qaf_flutter/utils/screen_utils.dart';
import 'package:qaf_flutter/env.production.dart' as env_prod;

class MapComponent extends StatefulWidget {
  MapComponent({Key key}) : super(key: key);
  @override
  _MapComponentState createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  Map<String, Object> _loationResult;
  BaiduLocation _baiduLocation;
  StreamSubscription<Map<String, Object>> _locationListener;

  BMFMapController _myMapController;
  LocationFlutterPlugin _locationPlugin = new LocationFlutterPlugin();
  BMFMapOptions mapOptions = BMFMapOptions(
    center: BMFCoordinate(30.213565, 120.227736),
    zoomLevel: 17,
    // minZoomLevel: 18,
    // maxZoomLevel: 18,
    showMapPoi: false,
    zoomEnabled: false,
    // gesturesEnabled: false,
    rotateEnabled: false,
    zoomEnabledWithTap: false,
    logoPosition: BMFLogoPosition.RightBottom,
    // mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0),
  );

  @override
  void initState() {
    super.initState();
    final envConfigJSON = JsonDecoder().convert(env_prod.ENV_CONFIG);
    //动态申请定位权限
    _locationPlugin.requestPermission();
    //设置iOS端AK, Android端AK可以直接在清单文件中配置
    LocationFlutterPlugin.setApiKey(envConfigJSON['BAIDU_MAP_AK']);
    _locationListener = _locationPlugin.onResultCallback().listen((Map<String, Object> result) {
      setState(() {
        _loationResult = result;
        print('_loationResult');
        print(_loationResult);
        // 设置中心点
        // _myMapController?.setCenterCoordinate(BMFCoordinate(_loationResult['latitude'], _loationResult['longitude']), true);
        try {
          _baiduLocation = BaiduLocation.fromMap(result);
          print('_baiduLocation');
          print(_baiduLocation);
        } catch (e) {
          print(e);
        }
      });
    });
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   _startLocation();
    // });
    // 设置AK(密钥)和坐标类型
    BMFMapSDK.setApiKeyAndCoordType(envConfigJSON['BAIDU_MAP_AK'], BMF_COORD_TYPE.BD09LL);
  }

  @override
  void dispose() {
    super.dispose();
    if (null != _locationListener) {
      _locationListener.cancel();
    }
  }

  /// 启动定位
  void _startLocation() {
    if (null != _locationPlugin) {
      _setLocOption();
      _locationPlugin.startLocation();
    }
  }

  /// 停止定位
  void _stopLocation() {
    if (null != _locationPlugin) {
      _locationPlugin.stopLocation();
    }
  }

  /// 设置android端和ios端定位参数
  void _setLocOption() {
    /// android 端设置定位参数
    BaiduLocationAndroidOption androidOption = new BaiduLocationAndroidOption();
    androidOption.setCoorType("bd09ll"); // 设置返回的位置坐标系类型
    androidOption.setIsNeedAltitude(true); // 设置是否需要返回海拔高度信息
    androidOption.setIsNeedAddres(true); // 设置是否需要返回地址信息
    androidOption.setIsNeedLocationPoiList(true); // 设置是否需要返回周边poi信息
    androidOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    androidOption.setIsNeedLocationDescribe(true); // 设置是否需要返回位置描述
    androidOption.setOpenGps(true); // 设置是否需要使用gps
    androidOption.setLocationMode(LocationMode.Hight_Accuracy); // 设置定位模式
    androidOption.setScanspan(1000); // 设置发起定位请求时间间隔

    Map androidMap = androidOption.getMap();

    /// ios 端设置定位参数
    BaiduLocationIOSOption iosOption = new BaiduLocationIOSOption();
    iosOption.setIsNeedNewVersionRgc(true); // 设置是否需要返回最新版本rgc信息
    iosOption.setBMKLocationCoordinateType("BMKLocationCoordinateTypeBMK09LL"); // 设置返回的位置坐标系类型
    iosOption.setActivityType("CLActivityTypeAutomotiveNavigation"); // 设置应用位置类型
    iosOption.setLocationTimeout(10); // 设置位置获取超时时间
    iosOption.setDesiredAccuracy("kCLLocationAccuracyBest"); // 设置预期精度参数
    iosOption.setReGeocodeTimeout(10); // 设置获取地址信息超时时间
    iosOption.setDistanceFilter(100); // 设置定位最小更新距离
    iosOption.setAllowsBackgroundLocationUpdates(true); // 是否允许后台定位
    iosOption.setPauseLocUpdateAutomatically(true); //  定位是否会被系统自动暂停

    Map iosMap = iosOption.getMap();

    _locationPlugin.prepareLoc(androidMap, iosMap);
  }

  void onBMFMapCreated(controller) {
    setState(() {
      _myMapController = controller;
    });
    BMFCustomMapStyleOption customMapStyleOption = BMFCustomMapStyleOption(
      customMapStyleID: "ea61444c101a8c861bd0d03989fa5d40",
      customMapStyleFilePath: 'assets/map/7271bb55da29d3ec22c35b1760c1ab6c.sty',
    );
    _myMapController?.setCustomMapStyleWithOptionPath(
      customMapStyleOption: customMapStyleOption,
      preload: (String path) {
        print('preload');
      },
      success: (String path) {
        print('success');
      },
      error: (int errorCode, String path) {
        print(errorCode);
        print(path);
      },
    );
    _myMapController?.showUserLocation(true);

    // 显示定位
    BMFCoordinate coordinate = BMFCoordinate(30.213565, 120.227736);
    BMFLocation location = BMFLocation(
      coordinate: coordinate,
      altitude: 0,
      horizontalAccuracy: 5,
      verticalAccuracy: -1.0,
      speed: -1.0,
      course: -1.0,
    );
    BMFUserLocation userLocation = BMFUserLocation(location: location);
    _myMapController?.updateLocationData(userLocation);
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Container(
    //       width: ScreenUtils.screenW(context),
    //       height: 600,
    //       child: BMFMapWidget(
    //         onBMFMapCreated: (controller) {
    //           onBMFMapCreated(controller);
    //         },
    //         mapOptions: mapOptions,
    //       ),
    //     ),
    //     // RaisedButton(
    //     //   onPressed: _startLocation,
    //     //   child: new Text('开始定位'),
    //     //   color: Colors.blue,
    //     //   textColor: Colors.white,
    //     // ),
    //   ],
    // );
    return Container(
      width: ScreenUtils.screenW(context),
      height: 600,
      child: BMFMapWidget(
        onBMFMapCreated: (controller) {
          onBMFMapCreated(controller);
        },
        mapOptions: mapOptions,
      ),
    );
  }
}
