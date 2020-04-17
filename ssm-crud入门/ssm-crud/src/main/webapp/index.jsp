<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/16 0016
  Time: 下午 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    pageContext.setAttribute()方法失效
//    pageContext.setAttribute("kkk", request.getContextPath());
//    System.out.println(request.getContextPath());
%>
<html>
<head>
    <title>Helloworld</title>
    <script src="/ssm-crud/static/js/jquery-3.1.1.min.js"></script>
    <link href="/ssm-crud/static/bootstrap3.3.7/css/bootstrap.min.css"
          rel="stylesheet">
    <script src="/ssm-crud/static/bootstrap3.3.7/js/bootstrap.min.js"></script>
</head>
<body>




<!-- 修改模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-contro-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control"
                                   id="email_update_input" placeholder="email@zuoluowo.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio"
                                                                name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label> <label class="radio-inline"> <input type="radio"
                                                                         name="gender" id="gender2_update_input" value="F"> 女
                        </label>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 新增模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName_add_input"
                                   placeholder="empName" name="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email_add_input"
                                   placeholder="email@zuoluwo.com" name="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio"
                                                                name="gender" id="gender1_add_input" value="M" checked>
                                男
                            </label> <label class="radio-inline"> <input type="radio"
                                                                         name="gender" id="gender2_add_input" value="F"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!--以bootstrap搭建页面  -->
<div class="container">
    <!-- 标题栏 -->
    <div class="row .col-md-12">
        <h1>SSM-CRUD</h1>
    </div>

    <!--按钮  -->
    <div class="row col-md-4 col-md-offset-8">
        <button type="button" class="btn btn-success" id="emp_add_modal_btn">新增</button>
        <button type="button" class="btn btn-danger" id="emp_del_all_btn">删除</button>
    </div>

    <!--显示表格数据  -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all" />
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>

            </table>
        </div>
    </div>
    <!-- end 显示表格数据-->

    <!-- 分页信息 -->
    <div class="row">
        <!-- 页面信息 -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
    <!-- end 分页信息-->

</div>
<!--end -->

<script>

    // 定义全局变量
    var totalRecord,currentPage;

    $(function() {
        //1.去首页
        to_page(1);
    });


    //跳转到指定页码
    function to_page(pn) {
        $.ajax({
            url : "/ssm-crud/emps",
            data : "pn=" + pn,
            type : "get",
            success : function(result) {
                console.log(result);
                //1.解析并显示员工信息
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析并显示分页条
                build_page_nav(result);
            }

        });

    }

    //解析员工数据，并显示
    function build_emps_table(result) {
        /* alert(result); */
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function(index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(
                item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>")
                .append(item.department.deptName);
            var editBtn = $("<button></button>").addClass(
                "btn btn-success btn-sm edit_btn").append(
                $("<span></span>").addClass(
                    "glyphicon glyphicon-pencil")).append("修改");
            editBtn.attr("emp_id", item.empId);
            var delBtn = $("<button></button>").addClass(
                "btn btn-danger btn-sm del_btn").append(
                $("<span></span>")
                    .addClass("glyphicon glyphicon-trash")).append(
                "删除");
            delBtn.attr("emp_id", item.empId);
            delBtn.attr("emp_name",	item.empName);
            var btnTd = $("<td></td>").append(editBtn).append("  ").append(
                delBtn);
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(
                genderTd).append(emailTd).append(deptNameTd).append(
                btnTd).appendTo("#emps_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append(
            "当前第" + result.extend.pageInfo.pageNum + "页,").append(
            "总共" + result.extend.pageInfo.pages + "页,").append(
            "总共" + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解解析显示分页条
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPage = $("<li></li>").append(
            $("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append(
            $("<a></a>").append("&laquo;").attr("href", "#"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            firstPage.click(function() {
                to_page(1);
            });
            prePage.click(function() {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var lastPage = $("<li></li>").append(
            $("<a></a>").append("末页").attr("href", "#"));
        var nextPage = $("<li></li>").append(
            $("<a></a>").append("&raquo;").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            lastPage.addClass("disabled");
            nextPage.addClass("disabled");
        } else {
            lastPage.click(function() {
                to_page(result.extend.pageInfo.total);
            });
            nextPage.click(function() {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        ul.append(firstPage);
        ul.append(prePage);
        $.each(result.extend.pageInfo.navigatepageNums, function(index,
                                                                 item) {
            var pageli = $("<li></li>").append(
                $("<a></a>").attr("href", "#").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                pageli.addClass("active");
            }
            ul.append(pageli);
            pageli.click(function() {
                to_page(item);
            })
        });

        ul.append(nextPage);
        ul.append(lastPage);

        var navEle = $("<nav></nav>").append(ul);

        navEle.appendTo("#page_nav_area");
    }

    //点击新增按钮,弹出新增模态框
    $("#emp_add_modal_btn").click(function() {
        //发送ajax请求，查出部门信息，显示在下拉列表中
        //每次弹出模态框，都要重置里面的内容！
        rest_form("#empAddModal form");
        //$("#empAddModal form")[0].reset();
        getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop : "static"
        })
    })

    //清空表单样式及内容
    function rest_form(ele){
        $(ele)[0].reset();
        $(ele).removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //发送ajax请求，查出部门信息
    function getDepts(ele) {
        //清空员工下来列表中的数据
        $(ele).empty();
        $.ajax({
            url : "/ssm-crud/depts",
            type : "GET",
            success : function(result) {
                //console.log(result);
                $.each(result.extend.departmentList, function(index, item) {
                    var optionEle = $("<option></option>").append(
                        this.deptName).attr("value", this.deptId);
                    optionEle.appendTo($(ele));
                })
            }
        })
    }

    //校验用户名是否可用
    $("#empName_add_input").change(function(){
        //1.发送ajax请求，校验用户名是否可用r
        var empName = this.value;

        $.ajax({
            url:"/ssm-crud/check",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                // console.log(result.extend.va_msg);
                if(result.code==100){
                    show_validata_msg("#empName_add_input", "success", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va", "success");
                }else {
                    show_validata_msg("#empName_add_input", "error", result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va", "fail");
                }
            }
        })
    })

    //校验邮箱格式是否正确
    $("#email_add_input").change(function(){
        //1.发送ajax请求，校验用户名是否可用r
        var email = this.value;
        var regEmail = 	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validata_msg("#email_add_input", "error", "邮箱格式不正确!");
            $("#emp_save_btn").attr("ajax-va2", "fail");
        } else {
            show_validata_msg("#email_add_input", "success", "");
            $("#emp_save_btn").attr("ajax-va2", "success");
        }
    })


    //展示校验提示信息
    function show_validata_msg(ele, status, msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");

        if("success"==status){

            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){

            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //保存新增员工按钮
    $("#emp_save_btn").click(function() {
        //1.将模态框中填写的数据提交给服务器
        //1.先对要提交给服务器中的数据进行校验

        //
        if("fail" == $(this).attr("ajax-va")||"fail"== $(this).attr("ajax-va2")){
            return false;
        }

        //2.发送ajax请求
        //alert($("#empAddModal form").serialize());
        $.ajax({
            url : "/ssm-crud/emp",
            type : "POST",
            data : $("#empAddModal form").serialize(),
            success : function(result) {
                if(result.code == 100){
                    //1.关闭模态框
                    $("#empAddModal").modal("hide");
                    //2.来到最后一页
                    to_page(totalRecord);
                }else {

                    // console.log(result);
                    if(undefined != result.extend.fieldError.empName) {
                        show_validata_msg("#empName_add_input", "error", result.extend.fieldError.empName);
                    }else {
                        show_validata_msg("#email_add_input", "error", result.extend.fieldError.email);
                    }
                }


            }
        })
    })

    //单个删除
    $(document).on("click", ".del_btn", function(){
        var empName = $(this).attr("emp_name");
        if(confirm("确认删除【"+empName+"】吗?")){
            $.ajax({
                url: "/ssm-crud/emp/"+$(this).attr("emp_id"),
                type: "DELETE",
                success: function(result){

                    //回到本页
                    to_page(currentPage);
                }
            })
        }
    })

    //全选状态
    $("#check_all").click(function(){
        $(".check_item").prop("checked", $(this).prop("checked"));
    })

    $(document).on("click", ".check_item", function(){

        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    })

    //
    $("#emp_del_all_btn").click(function(){
        empNames = "";
        empIds = ""
        $.each($(".check_item:checked"), function(){

            empNames += $(this).parent().next().next().text() +",";
            empIds += $(this).parent().next().text() + "-";
        })

        empNames = empNames.substring(0,empNames.length - 1);
        empIds = empIds.substring(0, empIds.length - 1);

        if(confirm("确认删除【"+empNames+"】吗?")){
            //发送ajax请求
            $.ajax({
                url: "/ssm-crud/emp/"+empIds,
                type: "DELETE",
                success: function(result){

                    //回到本页
                    to_page(currentPage);
                }
            })
        }
    })

    //点击编辑员工按钮弹出模态框
    $(document).on("click", ".edit_btn", function(){

        //0.查出员工信息，并显示员工列表
        //1.查出部门信息，并显示部门列表
        getDepts("#empUpdateModal select");
        var id = $(this).attr("emp_id");
        $("#emp_update_btn").attr("edit_id", id);
        getEmp(id);
        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop : "static"
        });



    })

    //查询员工信息，并显示
    function getEmp(id){

        $.ajax({
            url: "/ssm-crud/emp/"+id,
            type: "GET",
            success: function(result){
                console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        })
    }

    //点击修改，首先修改员工信息
    $("#emp_update_btn").click(function(){
        //1.验证邮箱信息
        var email = $("#email_update_input").val();
        var regEmail = 	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validata_msg("#email_update_input", "error", "邮箱格式不正确!");
            return false;

        } else {
            show_validata_msg("#email_update_input", "success", "");

        }
        //2.发送ajax请求，保存员工更新的数据
        $.ajax({
            url: "/ssm-crud/emp/"+$(this).attr("edit_id"),
            type: "PUT",
            data: $("#empUpdateModal form").serialize()+"&_method=PUT",
            success: function(result){
                /* alert(result.msg); */
                //1.关闭模态框1
                $("#empUpdateModal").modal("hide");
                //2.跳转到本页面
                to_page(currentPage);
            }
        })
    })

</script>
</body>
</html>
