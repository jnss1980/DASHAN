function MyEvent() {
    cntboth();
    getAllConst();
    cnlabLand_costs();
    cntBuilding_costs();
    cntSingle();
    cntSingle2();
    Maori_groups_Chu();
}
//計算均平 總坪數 / 規畫戶數
function cntboth() {
    if (document.getElementById('txtOverall').value != '' && document.getElementById('txtPlanning').value != '')
        document.getElementById('labBoth').innerHTML = parseFloat(document.getElementById('txtOverall').value) / parseFloat(document.getElementById('txtPlanning').value);
        document.getElementById('HidBoth').value = document.getElementById('labBoth').innerHTML;
}
function getAllConst() {
    if (document.getElementById('labBoth').innerHTML != '' && document.getElementById('txtSingle_floor_price').value != '') {
        document.getElementById('labland_profits').innerHTML = parseFloat(document.getElementById('labBoth').innerHTML) * parseFloat(document.getElementById('txtSingle_floor_price').value);
        document.getElementById('Hidland_profits').value = document.getElementById('labland_profits').innerHTML;
    }
}
//土地成本：([均坪 * 單坪均價] * 土地利潤 )
function cnlabLand_costs() {
    if (document.getElementById('labBoth').innerHTML != '' && document.getElementById('txtSingle_floor_price').value != '' && document.getElementById('txtSingle_floor').value != '')
        document.getElementById('labLand_costs').innerHTML =
           gPercentage((parseFloat(document.getElementById('labBoth').innerHTML) * parseFloat(document.getElementById('txtSingle_floor_price').value)), parseFloat(document.getElementById('txtSingle_floor').value));
    document.getElementById('HidLand_costs').value = document.getElementById('labLand_costs').innerHTML;
}
//建物成本：60*7=420 (建坪 * 建築單坪成本 )
function cntBuilding_costs() {
    if (document.getElementById('txtFloor_space').value != '' && document.getElementById('txtSinglefloor').value != '') {
        document.getElementById('labBuilding_costs').innerHTML = parseFloat(document.getElementById('txtFloor_space').value) * parseFloat(document.getElementById('txtSinglefloor').value);
        document.getElementById('HidBuilding_costs').value = document.getElementById('labBuilding_costs').innerHTML;
    }
}
//單戶成本： ( [土地成本 + 建物成本] )
function cntSingle() {
    if (document.getElementById('labland_profits').innerHTML != '' && document.getElementById('labBuilding_costs').innerHTML != '') {
        document.getElementById('labSingle_family_costs').innerHTML =
          parseFloat(document.getElementById('labland_profits').innerHTML) + parseFloat(document.getElementById('labBuilding_costs').innerHTML);
        document.getElementById('HidSingle_family_costs').value = document.getElementById('labSingle_family_costs').innerHTML;
    }
}
//單戶成本：([土地成本 + 建物成本] * 管銷)
function cntSingle2() {
    if (document.getElementById('labland_profits').innerHTML != '' && document.getElementById('labBuilding_costs').innerHTML != '' && document.getElementById('txtManagement').value != '') {
        document.getElementById('labSingle_family_costs2').innerHTML = (parseFloat(document.getElementById('labland_profits').innerHTML) + parseFloat(document.getElementById('labBuilding_costs').innerHTML)) * parseFloat(document.getElementById('txtManagement').value);
        document.getElementById('HidSingle_family_costs2').value = document.getElementById('labSingle_family_costs2').innerHTML;

    }
}
//基楚毛利：( [單戶成本 + 土地利潤] )
function Maori_groups_Chu() {
    if (document.getElementById('labSingle_family_costs').innerHTML != '' && document.getElementById('labLand_costs').innerHTML != '')
        document.getElementById('labMaori_groups_Chu').innerHTML =
            parseFloat(document.getElementById('labSingle_family_costs2').innerHTML) + parseFloat(document.getElementById('labLand_costs').innerHTML);
    document.getElementById('HidMaori_groups_Chu').value = document.getElementById('labMaori_groups_Chu').innerHTML;
}
function gPercentage(o, per) {
    //per = per.replace('%', '');
    var num = parseFloat(per) / parseFloat(100) + parseFloat(1);
    return (parseFloat(num) * parseFloat(o)) - parseFloat(o);
}