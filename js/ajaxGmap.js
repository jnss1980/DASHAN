function getAjax(sCity, sArea, otherFunction) {
    $.ajax({
        type: "POST",
        url: 'GMapService.asmx/GetJsonBySend',
        contentType: "application/json; charset=utf-8",
        async: false,
        cache: false,
        dataType: 'json',
        data: "{sCity:'"+sCity+"',sArea:'"+sArea+"'}",
        contentType: "application/json; charset=utf-8",  //設定傳回server格式                    
        //dataType: 'json',  //設定從Server接收的格式
        success: function (data) {
            var msg = eval('(' + data.d + ')');
            otherFunction(msg);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.statusText);
            alert(xhr.responseText);

            //上面兩行是開發期間，可以觀察錯誤訊息用，建議ajax正常後，可以註解掉
            //$(".panel").html("<span>" + xhr.responseText + "</span>");
        }
    }); //** ajax  End **//
}

function AddMark(data) {
    var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
    for (var i = 0; i < data.length; i++) {
        latlng = new google.maps.LatLng(data[i].lat, data[i].lng);
        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: "You are here! (at least within a " + sAddress + " meter radius)"
        });
    }
}