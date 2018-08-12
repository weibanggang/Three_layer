<%--
  Created by IntelliJ IDEA.
  User: 邦杠
  Date: 2018/8/11
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
   <style>
     table ,th,td{border:1px solid red;border-collapse:collapse}
   table{margin: auto;margin-bottom: 20px;}
   </style>
  </head>
  <body>
  <input type="button" value="get查看" onclick="getsele()"/>
  <input type="button" value="post查看" onclick="postselect()"/>
  <input type="button" value="ajax查看" onclick="ajaxsele()"/>
  <table id="tab1">
    <caption>get</caption>
    <th>tid</th><th>tname</th>
  </table>
  <table id="tab2">
    <caption>post</caption>
    <th>tid</th><th>tname</th>
  </table>
  <table id="tab3">
    <caption>ajax</caption>
    <th>tid</th><th>tname</th>
  </table>
  <script src="js/jquery.js"></script>
  <script>
    function getsele(){
        console.log("进入了getsele");
          //创建对象XMLHttpRequest
          var ajax=new XMLHttpRequest();
          //创建http请求，设置请求地址
          ajax.open("get","testservlet.do");
          //发送请求 (get为null post为参数)
          ajax.send(null);
          //给ajax设置事件(这里最多感知4[1-4]个状态)
        ajax.onreadystatechange = function(){
            //5.获取响应
            //responseText		以字符串的形式接收服务器返回的信息
            //console.log(ajax.readyState);
            if(ajax.readyState == 4 && ajax.status == 200){
                //使用JSON.parse方法将json字符串解析称为json对象
                var data = JSON.parse(ajax.responseText);
                //使用eval方法将json字符串解析成为json对象
                //var data=eval("("+ajax.responseText+")");
                var tab=document.getElementById("tab1");
                  for(var i=0;i<data.data.length;i++){
                      var tr=document.createElement("tr");
                      var tdtid=document.createElement("td");
                      var tdtname=document.createElement("td");
                      var tid=document.createTextNode(data.data[i].tid);
                      var tname=document.createTextNode(data.data[i].tname);
                      tdtid.appendChild(tid);
                      tdtname.appendChild(tname);
                      tr.appendChild(tdtid);
                      tr.appendChild(tdtname);
                      tab.append(tr);
                  }
            }
        }

    }
    function postselect(){
        console.log("进入了postselect");
        //创建对象
        var ajax=new XMLHttpRequest();
        //创建请求路径
        ajax.open("post","testservlet.do");
        //post方式传递数据是模仿form表单传递给服务器的,要设置header头协议
        ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
        //post在这里传参数 这里我们没有参数
        ajax.send("null");
        //给ajax设置事件(这里最多感知4[1-4]个状态)
        ajax.onreadystatechange = function() {
            //5.获取响应
            //responseText		以字符串的形式接收服务器返回的信息
            //console.log(ajax.readyState);
            if (ajax.readyState == 4 && ajax.status == 200) {
                //使用JSON.parse方法将json字符串解析称为json对象
                var data = JSON.parse(ajax.responseText);
                //使用eval方法将json字符串解析成为json对象
                //var data=eval("("+ajax.responseText+")");
                var tab = document.getElementById("tab2");
                for (var i = 0; i < data.data.length; i++) {
                    var tr = document.createElement("tr");
                    var tdtid = document.createElement("td");
                    var tdtname = document.createElement("td");
                    var tid = document.createTextNode(data.data[i].tid);
                    var tname = document.createTextNode(data.data[i].tname);
                    tdtid.appendChild(tid);
                    tdtname.appendChild(tname);
                    tr.appendChild(tdtid);
                    tr.appendChild(tdtname);
                    tab.append(tr);
                }
            }
        }
    }

    function ajaxsele(){
        //使用jq中的ajax进行请求
        console.log("进入了ajax");
        $.ajax({
            type:"get",
            url:"testservlet.do",
            dataType:"json",
            success:function (data) {
               var tab= $("#tab3");
                $.each(data.data,function (index,da) {
                        var tr=$("<tr/>");
                        var td1=$("<td/>").html(da.tid).appendTo(tr);
                        var td2=$("<td/>").html(da.tname).appendTo(tr);
                        tab.append(tr);
                })
            }
        })
          var tab=$("tab3");

    }
  </script>
  </body>
</html>
