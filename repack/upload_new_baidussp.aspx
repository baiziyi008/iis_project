﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload_new_baidussp.aspx.cs" Inherits="repack.upload_new_baidussp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 270px;
            text-align:right;
        }
        
        .button {
            width:100px;
            height:40px;
            font-size:14px;
            background-color:#145eb0;
            color:#eeeeee;
            text-align:center;
            border:1px solid #eeeeee;
            cursor:pointer;
        }
        .auto-style9 {
            width: 270px;
            height: 102px;
        }
        .auto-style10 {
            height: 102px;
        }
        .auto-style15 {
            width: 100%;
        }
        .auto-style16 {
            width: 270px;
            height: 23px;
        }
        .auto-style17 {
            height: 23px;
        }
        .auto-style18 {
            width: 270px;
            text-align: right;
            height: 36px;
        }
        .auto-style19 {
            height: 36px;
        }
        </style>
</head>
<body style="margin:0px auto; width:986px; background-color:#eeeeee;">
    <form id="form1" runat="server">
    <div style="color:#666666; font-size:13px; font-family:'微软雅黑';" class="auto-style15">
        
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18"></td>
                <td style="font-size:14px; font-weight:bold; color:#333333;" class="auto-style19">
                    添加百度SSP信息</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">名称：</td>
                <td>
                    <input id="name" name="name" type="text" style="width:250px;" /></td>
            </tr>
            <tr>
                <td class="auto-style1">AppID：</td>
                <td>
                    <input id="appid" name="appid" type="text" style="width:250px;" /></td>
            </tr>
            <tr>
                <td class="auto-style1">插屏ID：</td>
                <td>
                    <input id="insert_adid" name="insert_adid" type="text" style="width:250px;" /></td>
            </tr>
            <tr>
                <td class="auto-style1">开屏ID：</td>
                <td>
                    <input id="start_adid" name="start_adid" type="text" style="width:250px;" /></td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10">
                    <input class="button" id="Button2" type="button" value="提交" onclick="insert_data();" /></td>
            </tr>
            <tr>
                <td class="auto-style16"></td>
                <td class="auto-style17">
                    </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>

<script type="text/javascript">
    function insert_data() {
        // FormData 对象
        var form = new FormData();
        form.append("type", "new_baidussp_form");
        form.append("name", document.getElementById("name").value);
        form.append("appid", document.getElementById("appid").value);
        form.append("insert_adid", document.getElementById("insert_adid").value);
        form.append("start_adid", document.getElementById("start_adid").value);
        // XMLHttpRequest 对象
        var xhr = new XMLHttpRequest();
        xhr.open("post", "insert_data.ashx", true);
        xhr.onload = function (oEvent) {
            if (xhr.status == 200) {
                var result = JSON.parse(xhr.responseText);
                if (result.state == 1) {
                    alert("添加成功！");
                    document.location.href = "key_baidussp_manager.aspx";
                } else {
                    alert(result.message);
                }
            }
        };
        xhr.send(form);
    }
</script>
