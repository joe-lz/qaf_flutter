const CityData = '''
[
  {
    "name": "北京市",
    "city": [
      {
        "name": "北京市",
        "area": []
      }
    ]
  },
  {
    "name": "天津市",
    "city": [
      {
        "name": "天津市",
        "area": []
      }
    ]
  },
  {
    "name": "河北省",
    "city": [
      {
        "name": "石家庄市",
        "area": []
      },
      {
        "name": "唐山市",
        "area": []
      },
      {
        "name": "秦皇岛市",
        "area": []
      },
      {
        "name": "邯郸市",
        "area": []
      },
      {
        "name": "邢台市",
        "area": []
      },
      {
        "name": "保定市",
        "area": []
      },
      {
        "name": "张家口市",
        "area": []
      },
      {
        "name": "承德市",
        "area": []
      },
      {
        "name": "沧州市",
        "area": []
      },
      {
        "name": "廊坊市",
        "area": []
      },
      {
        "name": "衡水市",
        "area": []
      }
    ]
  },
  {
    "name": "山西省",
    "city": [
      {
        "name": "太原市",
        "area": []
      },
      {
        "name": "大同市",
        "area": []
      },
      {
        "name": "阳泉市",
        "area": []
      },
      {
        "name": "长治市",
        "area": []
      },
      {
        "name": "晋城市",
        "area": []
      },
      {
        "name": "朔州市",
        "area": []
      },
      {
        "name": "晋中市",
        "area": []
      },
      {
        "name": "运城市",
        "area": []
      },
      {
        "name": "忻州市",
        "area": []
      },
      {
        "name": "临汾市",
        "area": []
      },
      {
        "name": "吕梁市",
        "area": []
      }
    ]
  },
  {
    "name": "内蒙古自治区",
    "city": [
      {
        "name": "呼和浩特市",
        "area": []
      },
      {
        "name": "包头市",
        "area": []
      },
      {
        "name": "乌海市",
        "area": []
      },
      {
        "name": "赤峰市",
        "area": []
      },
      {
        "name": "通辽市",
        "area": []
      },
      {
        "name": "鄂尔多斯市",
        "area": []
      },
      {
        "name": "呼伦贝尔市",
        "area": []
      },
      {
        "name": "巴彦淖尔市",
        "area": []
      },
      {
        "name": "乌兰察布市",
        "area": []
      },
      {
        "name": "兴安盟",
        "area": []
      },
      {
        "name": "锡林郭勒盟",
        "area": []
      },
      {
        "name": "阿拉善盟",
        "area": []
      }
    ]
  },
  {
    "name": "辽宁省",
    "city": [
      {
        "name": "沈阳市",
        "area": []
      },
      {
        "name": "大连市",
        "area": []
      },
      {
        "name": "鞍山市",
        "area": []
      },
      {
        "name": "抚顺市",
        "area": []
      },
      {
        "name": "本溪市",
        "area": []
      },
      {
        "name": "丹东市",
        "area": []
      },
      {
        "name": "锦州市",
        "area": []
      },
      {
        "name": "营口市",
        "area": []
      },
      {
        "name": "阜新市",
        "area": []
      },
      {
        "name": "辽阳市",
        "area": []
      },
      {
        "name": "盘锦市",
        "area": []
      },
      {
        "name": "铁岭市",
        "area": []
      },
      {
        "name": "朝阳市",
        "area": []
      },
      {
        "name": "葫芦岛市",
        "area": []
      }
    ]
  },
  {
    "name": "吉林省",
    "city": [
      {
        "name": "长春市",
        "area": []
      },
      {
        "name": "吉林市",
        "area": []
      },
      {
        "name": "四平市",
        "area": []
      },
      {
        "name": "辽源市",
        "area": []
      },
      {
        "name": "通化市",
        "area": []
      },
      {
        "name": "白山市",
        "area": []
      },
      {
        "name": "松原市",
        "area": []
      },
      {
        "name": "白城市",
        "area": []
      },
      {
        "name": "延边朝鲜族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "黑龙江省",
    "city": [
      {
        "name": "哈尔滨市",
        "area": []
      },
      {
        "name": "齐齐哈尔市",
        "area": []
      },
      {
        "name": "鸡西市",
        "area": []
      },
      {
        "name": "鹤岗市",
        "area": []
      },
      {
        "name": "双鸭山市",
        "area": []
      },
      {
        "name": "大庆市",
        "area": []
      },
      {
        "name": "伊春市",
        "area": []
      },
      {
        "name": "佳木斯市",
        "area": []
      },
      {
        "name": "七台河市",
        "area": []
      },
      {
        "name": "牡丹江市",
        "area": []
      },
      {
        "name": "黑河市",
        "area": []
      },
      {
        "name": "绥化市",
        "area": []
      },
      {
        "name": "大兴安岭地区",
        "area": []
      }
    ]
  },
  {
    "name": "上海市",
    "city": [
      {
        "name": "上海市",
        "area": []
      }
    ]
  },
  {
    "name": "江苏省",
    "city": [
      {
        "name": "南京市",
        "area": []
      },
      {
        "name": "无锡市",
        "area": []
      },
      {
        "name": "徐州市",
        "area": []
      },
      {
        "name": "常州市",
        "area": []
      },
      {
        "name": "苏州市",
        "area": []
      },
      {
        "name": "南通市",
        "area": []
      },
      {
        "name": "连云港市",
        "area": []
      },
      {
        "name": "淮安市",
        "area": []
      },
      {
        "name": "盐城市",
        "area": []
      },
      {
        "name": "扬州市",
        "area": []
      },
      {
        "name": "镇江市",
        "area": []
      },
      {
        "name": "泰州市",
        "area": []
      },
      {
        "name": "宿迁市",
        "area": []
      }
    ]
  },
  {
    "name": "浙江省",
    "city": [
      {
        "name": "杭州市",
        "area": []
      },
      {
        "name": "宁波市",
        "area": []
      },
      {
        "name": "温州市",
        "area": []
      },
      {
        "name": "嘉兴市",
        "area": []
      },
      {
        "name": "湖州市",
        "area": []
      },
      {
        "name": "绍兴市",
        "area": []
      },
      {
        "name": "金华市",
        "area": []
      },
      {
        "name": "衢州市",
        "area": []
      },
      {
        "name": "舟山市",
        "area": []
      },
      {
        "name": "台州市",
        "area": []
      },
      {
        "name": "丽水市",
        "area": []
      }
    ]
  },
  {
    "name": "安徽省",
    "city": [
      {
        "name": "合肥市",
        "area": []
      },
      {
        "name": "芜湖市",
        "area": []
      },
      {
        "name": "蚌埠市",
        "area": []
      },
      {
        "name": "淮南市",
        "area": []
      },
      {
        "name": "马鞍山市",
        "area": []
      },
      {
        "name": "淮北市",
        "area": []
      },
      {
        "name": "铜陵市",
        "area": []
      },
      {
        "name": "安庆市",
        "area": []
      },
      {
        "name": "黄山市",
        "area": []
      },
      {
        "name": "滁州市",
        "area": []
      },
      {
        "name": "阜阳市",
        "area": []
      },
      {
        "name": "宿州市",
        "area": []
      },
      {
        "name": "六安市",
        "area": []
      },
      {
        "name": "亳州市",
        "area": []
      },
      {
        "name": "池州市",
        "area": []
      },
      {
        "name": "宣城市",
        "area": []
      }
    ]
  },
  {
    "name": "福建省",
    "city": [
      {
        "name": "福州市",
        "area": []
      },
      {
        "name": "厦门市",
        "area": []
      },
      {
        "name": "莆田市",
        "area": []
      },
      {
        "name": "三明市",
        "area": []
      },
      {
        "name": "泉州市",
        "area": []
      },
      {
        "name": "漳州市",
        "area": []
      },
      {
        "name": "南平市",
        "area": []
      },
      {
        "name": "龙岩市",
        "area": []
      },
      {
        "name": "宁德市",
        "area": []
      }
    ]
  },
  {
    "name": "江西省",
    "city": [
      {
        "name": "南昌市",
        "area": []
      },
      {
        "name": "景德镇市",
        "area": []
      },
      {
        "name": "萍乡市",
        "area": []
      },
      {
        "name": "九江市",
        "area": []
      },
      {
        "name": "新余市",
        "area": []
      },
      {
        "name": "鹰潭市",
        "area": []
      },
      {
        "name": "赣州市",
        "area": []
      },
      {
        "name": "吉安市",
        "area": []
      },
      {
        "name": "宜春市",
        "area": []
      },
      {
        "name": "抚州市",
        "area": []
      },
      {
        "name": "上饶市",
        "area": []
      }
    ]
  },
  {
    "name": "山东省",
    "city": [
      {
        "name": "济南市",
        "area": []
      },
      {
        "name": "青岛市",
        "area": []
      },
      {
        "name": "淄博市",
        "area": []
      },
      {
        "name": "枣庄市",
        "area": []
      },
      {
        "name": "东营市",
        "area": []
      },
      {
        "name": "烟台市",
        "area": []
      },
      {
        "name": "潍坊市",
        "area": []
      },
      {
        "name": "济宁市",
        "area": []
      },
      {
        "name": "泰安市",
        "area": []
      },
      {
        "name": "威海市",
        "area": []
      },
      {
        "name": "日照市",
        "area": []
      },
      {
        "name": "莱芜市",
        "area": []
      },
      {
        "name": "临沂市",
        "area": []
      },
      {
        "name": "德州市",
        "area": []
      },
      {
        "name": "聊城市",
        "area": []
      },
      {
        "name": "滨州市",
        "area": []
      },
      {
        "name": "菏泽市",
        "area": []
      }
    ]
  },
  {
    "name": "河南省",
    "city": [
      {
        "name": "郑州市",
        "area": []
      },
      {
        "name": "开封市",
        "area": []
      },
      {
        "name": "洛阳市",
        "area": []
      },
      {
        "name": "平顶山市",
        "area": []
      },
      {
        "name": "安阳市",
        "area": []
      },
      {
        "name": "鹤壁市",
        "area": []
      },
      {
        "name": "新乡市",
        "area": []
      },
      {
        "name": "焦作市",
        "area": []
      },
      {
        "name": "濮阳市",
        "area": []
      },
      {
        "name": "许昌市",
        "area": []
      },
      {
        "name": "漯河市",
        "area": []
      },
      {
        "name": "三门峡市",
        "area": []
      },
      {
        "name": "南阳市",
        "area": []
      },
      {
        "name": "商丘市",
        "area": []
      },
      {
        "name": "信阳市",
        "area": []
      },
      {
        "name": "周口市",
        "area": []
      },
      {
        "name": "驻马店市",
        "area": []
      },
      {
        "name": "省直辖县级行政区划",
        "area": []
      }
    ]
  },
  {
    "name": "湖北省",
    "city": [
      {
        "name": "武汉市",
        "area": []
      },
      {
        "name": "黄石市",
        "area": []
      },
      {
        "name": "十堰市",
        "area": []
      },
      {
        "name": "宜昌市",
        "area": []
      },
      {
        "name": "襄阳市",
        "area": []
      },
      {
        "name": "鄂州市",
        "area": []
      },
      {
        "name": "荆门市",
        "area": []
      },
      {
        "name": "孝感市",
        "area": []
      },
      {
        "name": "荆州市",
        "area": []
      },
      {
        "name": "黄冈市",
        "area": []
      },
      {
        "name": "咸宁市",
        "area": []
      },
      {
        "name": "随州市",
        "area": []
      },
      {
        "name": "恩施土家族苗族自治州",
        "area": []
      },
      {
        "name": "省直辖县级行政区划",
        "area": []
      }
    ]
  },
  {
    "name": "湖南省",
    "city": [
      {
        "name": "长沙市",
        "area": []
      },
      {
        "name": "株洲市",
        "area": []
      },
      {
        "name": "湘潭市",
        "area": []
      },
      {
        "name": "衡阳市",
        "area": []
      },
      {
        "name": "邵阳市",
        "area": []
      },
      {
        "name": "岳阳市",
        "area": []
      },
      {
        "name": "常德市",
        "area": []
      },
      {
        "name": "张家界市",
        "area": []
      },
      {
        "name": "益阳市",
        "area": []
      },
      {
        "name": "郴州市",
        "area": []
      },
      {
        "name": "永州市",
        "area": []
      },
      {
        "name": "怀化市",
        "area": []
      },
      {
        "name": "娄底市",
        "area": []
      },
      {
        "name": "湘西土家族苗族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "广东省",
    "city": [
      {
        "name": "广州市",
        "area": []
      },
      {
        "name": "韶关市",
        "area": []
      },
      {
        "name": "深圳市",
        "area": []
      },
      {
        "name": "珠海市",
        "area": []
      },
      {
        "name": "汕头市",
        "area": []
      },
      {
        "name": "佛山市",
        "area": []
      },
      {
        "name": "江门市",
        "area": []
      },
      {
        "name": "湛江市",
        "area": []
      },
      {
        "name": "茂名市",
        "area": []
      },
      {
        "name": "肇庆市",
        "area": []
      },
      {
        "name": "惠州市",
        "area": []
      },
      {
        "name": "梅州市",
        "area": []
      },
      {
        "name": "汕尾市",
        "area": []
      },
      {
        "name": "河源市",
        "area": []
      },
      {
        "name": "阳江市",
        "area": []
      },
      {
        "name": "清远市",
        "area": []
      },
      {
        "name": "东莞市",
        "area": []
      },
      {
        "name": "中山市",
        "area": []
      },
      {
        "name": "潮州市",
        "area": []
      },
      {
        "name": "揭阳市",
        "area": []
      },
      {
        "name": "云浮市",
        "area": []
      }
    ]
  },
  {
    "name": "广西壮族自治区",
    "city": [
      {
        "name": "南宁市",
        "area": []
      },
      {
        "name": "柳州市",
        "area": []
      },
      {
        "name": "桂林市",
        "area": []
      },
      {
        "name": "梧州市",
        "area": []
      },
      {
        "name": "北海市",
        "area": []
      },
      {
        "name": "防城港市",
        "area": []
      },
      {
        "name": "钦州市",
        "area": []
      },
      {
        "name": "贵港市",
        "area": []
      },
      {
        "name": "玉林市",
        "area": []
      },
      {
        "name": "百色市",
        "area": []
      },
      {
        "name": "贺州市",
        "area": []
      },
      {
        "name": "河池市",
        "area": []
      },
      {
        "name": "来宾市",
        "area": []
      },
      {
        "name": "崇左市",
        "area": []
      }
    ]
  },
  {
    "name": "海南省",
    "city": [
      {
        "name": "海口市",
        "area": []
      },
      {
        "name": "三亚市",
        "area": []
      },
      {
        "name": "三沙市",
        "area": []
      },
      {
        "name": "儋州市",
        "area": []
      },
      {
        "name": "省直辖县级行政区划",
        "area": []
      }
    ]
  },
  {
    "name": "重庆市",
    "city": [
      {
        "name": "重庆市",
        "area": []
      },
      {
        "name": "县",
        "area": []
      }
    ]
  },
  {
    "name": "四川省",
    "city": [
      {
        "name": "成都市",
        "area": []
      },
      {
        "name": "自贡市",
        "area": []
      },
      {
        "name": "攀枝花市",
        "area": []
      },
      {
        "name": "泸州市",
        "area": []
      },
      {
        "name": "德阳市",
        "area": []
      },
      {
        "name": "绵阳市",
        "area": []
      },
      {
        "name": "广元市",
        "area": []
      },
      {
        "name": "遂宁市",
        "area": []
      },
      {
        "name": "内江市",
        "area": []
      },
      {
        "name": "乐山市",
        "area": []
      },
      {
        "name": "南充市",
        "area": []
      },
      {
        "name": "眉山市",
        "area": []
      },
      {
        "name": "宜宾市",
        "area": []
      },
      {
        "name": "广安市",
        "area": []
      },
      {
        "name": "达州市",
        "area": []
      },
      {
        "name": "雅安市",
        "area": []
      },
      {
        "name": "巴中市",
        "area": []
      },
      {
        "name": "资阳市",
        "area": []
      },
      {
        "name": "阿坝藏族羌族自治州",
        "area": []
      },
      {
        "name": "甘孜藏族自治州",
        "area": []
      },
      {
        "name": "凉山彝族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "贵州省",
    "city": [
      {
        "name": "贵阳市",
        "area": []
      },
      {
        "name": "六盘水市",
        "area": []
      },
      {
        "name": "遵义市",
        "area": []
      },
      {
        "name": "安顺市",
        "area": []
      },
      {
        "name": "毕节市",
        "area": []
      },
      {
        "name": "铜仁市",
        "area": []
      },
      {
        "name": "黔西南布依族苗族自治州",
        "area": []
      },
      {
        "name": "黔东南苗族侗族自治州",
        "area": []
      },
      {
        "name": "黔南布依族苗族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "云南省",
    "city": [
      {
        "name": "昆明市",
        "area": []
      },
      {
        "name": "曲靖市",
        "area": []
      },
      {
        "name": "玉溪市",
        "area": []
      },
      {
        "name": "保山市",
        "area": []
      },
      {
        "name": "昭通市",
        "area": []
      },
      {
        "name": "丽江市",
        "area": []
      },
      {
        "name": "普洱市",
        "area": []
      },
      {
        "name": "临沧市",
        "area": []
      },
      {
        "name": "楚雄彝族自治州",
        "area": []
      },
      {
        "name": "红河哈尼族彝族自治州",
        "area": []
      },
      {
        "name": "文山壮族苗族自治州",
        "area": []
      },
      {
        "name": "西双版纳傣族自治州",
        "area": []
      },
      {
        "name": "大理白族自治州",
        "area": []
      },
      {
        "name": "德宏傣族景颇族自治州",
        "area": []
      },
      {
        "name": "怒江傈僳族自治州",
        "area": []
      },
      {
        "name": "迪庆藏族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "西藏自治区",
    "city": [
      {
        "name": "拉萨市",
        "area": []
      },
      {
        "name": "日喀则市",
        "area": []
      },
      {
        "name": "昌都市",
        "area": []
      },
      {
        "name": "林芝市",
        "area": []
      },
      {
        "name": "山南市",
        "area": []
      },
      {
        "name": "那曲市",
        "area": []
      },
      {
        "name": "阿里地区",
        "area": []
      }
    ]
  },
  {
    "name": "陕西省",
    "city": [
      {
        "name": "西安市",
        "area": []
      },
      {
        "name": "铜川市",
        "area": []
      },
      {
        "name": "宝鸡市",
        "area": []
      },
      {
        "name": "咸阳市",
        "area": []
      },
      {
        "name": "渭南市",
        "area": []
      },
      {
        "name": "延安市",
        "area": []
      },
      {
        "name": "汉中市",
        "area": []
      },
      {
        "name": "榆林市",
        "area": []
      },
      {
        "name": "安康市",
        "area": []
      },
      {
        "name": "商洛市",
        "area": []
      }
    ]
  },
  {
    "name": "甘肃省",
    "city": [
      {
        "name": "兰州市",
        "area": []
      },
      {
        "name": "嘉峪关市",
        "area": []
      },
      {
        "name": "金昌市",
        "area": []
      },
      {
        "name": "白银市",
        "area": []
      },
      {
        "name": "天水市",
        "area": []
      },
      {
        "name": "武威市",
        "area": []
      },
      {
        "name": "张掖市",
        "area": []
      },
      {
        "name": "平凉市",
        "area": []
      },
      {
        "name": "酒泉市",
        "area": []
      },
      {
        "name": "庆阳市",
        "area": []
      },
      {
        "name": "定西市",
        "area": []
      },
      {
        "name": "陇南市",
        "area": []
      },
      {
        "name": "临夏回族自治州",
        "area": []
      },
      {
        "name": "甘南藏族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "青海省",
    "city": [
      {
        "name": "西宁市",
        "area": []
      },
      {
        "name": "海东市",
        "area": []
      },
      {
        "name": "海北藏族自治州",
        "area": []
      },
      {
        "name": "黄南藏族自治州",
        "area": []
      },
      {
        "name": "海南藏族自治州",
        "area": []
      },
      {
        "name": "果洛藏族自治州",
        "area": []
      },
      {
        "name": "玉树藏族自治州",
        "area": []
      },
      {
        "name": "海西蒙古族藏族自治州",
        "area": []
      }
    ]
  },
  {
    "name": "宁夏回族自治区",
    "city": [
      {
        "name": "银川市",
        "area": []
      },
      {
        "name": "石嘴山市",
        "area": []
      },
      {
        "name": "吴忠市",
        "area": []
      },
      {
        "name": "固原市",
        "area": []
      },
      {
        "name": "中卫市",
        "area": []
      }
    ]
  },
  {
    "name": "新疆维吾尔自治区",
    "city": [
      {
        "name": "乌鲁木齐市",
        "area": []
      },
      {
        "name": "克拉玛依市",
        "area": []
      },
      {
        "name": "吐鲁番市",
        "area": []
      },
      {
        "name": "哈密市",
        "area": []
      },
      {
        "name": "昌吉回族自治州",
        "area": []
      },
      {
        "name": "博尔塔拉蒙古自治州",
        "area": []
      },
      {
        "name": "巴音郭楞蒙古自治州",
        "area": []
      },
      {
        "name": "阿克苏地区",
        "area": []
      },
      {
        "name": "克孜勒苏柯尔克孜自治州",
        "area": []
      },
      {
        "name": "喀什地区",
        "area": []
      },
      {
        "name": "和田地区",
        "area": []
      },
      {
        "name": "伊犁哈萨克自治州",
        "area": []
      },
      {
        "name": "塔城地区",
        "area": []
      },
      {
        "name": "阿勒泰地区",
        "area": []
      },
      {
        "name": "自治区直辖县级行政区划",
        "area": []
      }
    ]
  }
]
''';
