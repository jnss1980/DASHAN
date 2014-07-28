var lat = document.getElementById('Hidlat').value;
var lng = document.getElementById('Hidlng').value;
var address = document.getElementById("HidAddress").value;

if (navigator.geolocation) {
    if (lat != '' && lng != '') {
        success(null);
    } else {
        navigator.geolocation.getCurrentPosition(success, error);
    }

} else {
    error('not supported');
}

function MyPosition(Position) {
    if (Position == '') {
        navigator.geolocation.getCurrentPosition(success, error);
    } else {
        navigator.geolocation.getCurrentPosition(success, error);
    }
}

function error(msg) {
    var s = document.querySelector('#status');
    s.innerHTML = typeof msg == 'string' ? msg : "failed";
    s.className = 'fail';
    // console.log(arguments);
}

function BindLoaction(lat, lan) {
    var s = document.querySelector('#status');
    s.innerHTML = "目前所在地";
    s.className = 'success';
    var mapcanvas = document.getElementById('mapcanvas');
}

function success(position) {
    var latlng = '';
    var sAddress = '';
    var sCity = '';
    var sArea = '';
    if (position != null) {
        latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

        lat = position.coords.latitude;
        lng = position.coords.longitude;
        sAddress = position.coords.accuracy;
        document.getElementById('Hidlat').value = lat;
        document.getElementById('Hidlng').value = lng;
    } else {
        latlng = new google.maps.LatLng(lat, lng);
        sAddress = address;
    }

    var myOptions = {
        zoom: 15,
        center: latlng,
        mapTypeControl: false,
        navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL },
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

    var marker = new google.maps.Marker({
        position: latlng,
        map: map,
        title: "You are here! (at least within a " + sAddress + " meter radius)"
    });

    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'latLng': latlng }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            //autoDectCity=results[1].address_components[1].long_name; //call address_components的方法
            document.getElementById('status').innerHTML = results[0].formatted_address;
            document.getElementById('HidAddress').value = results[0].formatted_address;
            
            var sCity = results[0].address_components[4].long_name;
            var sArea = results[0].address_components[3].long_name;

            //var sCity = results[0].address_components[2].long_name;
            //var sArea = results[0].address_components[1].long_name;

            //autoDectCity = results[0].formatted_address;
            //addrStr = autoDectCity.split(',');
            //alert(addrStr[addrStr.length - 2]);
            //countyCity = addrStr[addrStr.length - 2]; //       " 返回值：formatted_address" : "No. 115, Section 2, Zhōngshān Road, Shoufeng Township, Hualien County, Taiwan 974",  用 " , " 分割 縣市一定是倒數第二個
            //alert(countyCity);
            getAjax(sCity, sArea, AddMark, map);
        } else {
            alert('Geocoder failed due to: ' + status);
        }
    });


    function getLatLngByAddr() {
        var geocoder = new google.maps.Geocoder();  //定義一個Geocoder物件
        geocoder.geocode(
            { address: '[地址]' },    //設定地址的字串
            function (results, status) {    //callback function
                if (status == google.maps.GeocoderStatus.OK) {    //判斷狀態
                    alert(results[0].geometry.location);             //取得座標                                 
                } else {
                    alert('Error');
                }
            }
     );
    }

}

function getAjax(sCity, sArea, otherFunction, oMap) {
    $.ajax({
        type: "POST",
        url: 'GMapService.asmx/GetJsonBySend',
        contentType: "application/json; charset=utf-8",
        async: false,
        cache: false,
        dataType: 'json',
        data: "{sCity:'" + sCity + "',sArea:'" + sArea + "'}",
        contentType: "application/json; charset=utf-8",  //設定傳回server格式                    
        //dataType: 'json',  //設定從Server接收的格式
        success: function (data) {
            var msg = eval('(' + data.d + ')');
            otherFunction(msg, oMap);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.statusText);
            alert(xhr.responseText);

            //上面兩行是開發期間，可以觀察錯誤訊息用，建議ajax正常後，可以註解掉
            //$(".panel").html("<span>" + xhr.responseText + "</span>");
        }
    }); //** ajax  End **//
}

function AddMark(data, oMap) {

    for (var i = 0; i < data.length; i++) {
        latlng = new google.maps.LatLng(data[i].lat, data[i].lng);
        var marker = new google.maps.Marker({
            position: latlng,
            map: oMap,
            title: data[i].p成交價,
            icon: createMarkerIcon(data[i].pNam +'('+ data[i].p型態+')' + ':' + data[i].p成交價)
        });
    }
}



//利用canvas產生一個內含文字的圖檔
function createMarkerIcon(text, opt) {
    //定義預設參數
    var defaultOptions = {
        fontStyle: "normal", //normal, bold, italic
        fontName: "Arial",
        fontSize: 12, //以Pixel為單位
        bgColor: "darkblue",
        fgColor: "white",
        padding: 4,
        arrowHeight: 6 //下方尖角高度
    };
    options = $.extend(defaultOptions, opt);
    //建立Canvas，開始幹活兒
    var canvas = document.createElement("canvas"),
        context = canvas.getContext("2d");
    //評估文字尺寸
    var font = options.fontStyle + " " + options.fontSize + "px " +
               options.fontName;
    context.font = font;
    var metrics = context.measureText(text);
    //文字大小加上padding作為外部尺寸
    var w = metrics.width + options.padding * 2;
    //高度以Font的大小為準
    var h = options.fontSize + options.padding * 2 +
            options.arrowHeight;
    canvas.width = w;
    canvas.height = h;
    //邊框及背景
    context.beginPath();
    context.rect(0, 0, w, h - options.arrowHeight);
    context.fillStyle = options.bgColor;
    context.fill();
    //畫出下方尖角
    context.beginPath();
    var x = w / 2, y = h, arwSz = options.arrowHeight;
    context.moveTo(x, y);
    context.lineTo(x - arwSz, y - arwSz);
    context.lineTo(x + arwSz, y - arwSz);
    context.lineTo(x, y);
    context.fill();
    //印出文字
    context.textAlign = "center";
    context.fillStyle = options.fgColor;
    context.font = font;
    context.fillText(text,
        w / 2,
        (h - options.arrowHeight) / 2 + options.padding);
    //傳回DataURI字串
    return canvas.toDataURL();
}