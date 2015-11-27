<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="repack.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
    <p>
        <input id="searchText" type="text" onkeyup="smart_find(this);"/>输入关键字自动匹配</p>
    <div>
    <!--该DIV作为现实搜索提示的结果-->
    <div id="search_div" style="margin-top:0px" ></div>
    </div>
</body>
</html>
<script type="text/javascript">
    var list_info = null;
    function smart_find(obj) {
        //var key = obj.value;
        //获得文本框中的值
        var key = escape(document.getElementById("searchText").value);
        if (key != null) {
            var form = new FormData();
            form.append("id", key + "");
            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("post", "get_search_list.ashx", true);
            xhr.onload = function (oEvent) {
                if (xhr.status == 200) {
                    var result = JSON.parse(xhr.responseText);
                    if (result.state == 1) {
                        list_info = result.info;
                        document.getElementById("search_div").innerHTML = "";
                        document.getElementById("search_div").innerHTML = result.message;
                        //$(search_div).html("");
                        //$(search_div).html(result.message);
                    } else {
                        alert("获取信息失败！");
                    }
                }
            };
            xhr.send(form);
        }
    }

    function handle_search(list) {
        var htmlStr = null;

        //循环构建HTML代码
        for (var i = 0; i < resultStrArr.length - 1; i++) {
            var htmlStr = '<div onmouseover="selectOverDiv(this,' + i + ');" ';
            htmlStr += 'onmouseout="selectOutDiv(this,' + i + ');" ';
            htmlStr += 'onclick="setSearch(this.innerHTML);" ';
            htmlStr += 'class="search_link " style="display:block;width:100%;" >' + resultStrArr[i] + '</div>';
        }
    }
</script>
