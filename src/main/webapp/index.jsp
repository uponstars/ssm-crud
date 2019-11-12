<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/javascript/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 修改员工的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">员工修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="empName_update_static"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@starofdream.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">email</label>
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
				</label>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <select class="form-control" name="dId" id="dept_add_select"></select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 新增员工的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@starofdream.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">email</label>
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
				</label>
			  </div>
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			      <select class="form-control" name="dId" id="dept_add_select"></select>
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
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
			</div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var totalRecord;
		var currentPage;
		//页面加载完成以后直接发送一个ajax请求要到分页数据
		$(function() {
			to_page(1);
		})
		
		function to_page(pn) {
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn=" + pn,
				type:"GET",
				success:function(result){
					//解析并显示员工数据
					build_emps_table(result);
					//解析并显示分页信息
					build_page_info(result);
					//解析显示分页条
					build_page_nav(result);
				}
			});
		}
		
		//解析显示员工信息
		function build_emps_table(result) {
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
				                                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				editBtn.attr("edit-id", item.empId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                									.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(empIdTd)
							  .append(empNameTd)
							  .append(genderTd)
							  .append(emailTd)
							  .append(deptNameTd)
							  .append(btnTd)
							  .appendTo("#emps_table tbody");
			});
		}
		
		//解析分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append("当前" + result.extend.pageInfo.pageNum
					                    + "页，总" + result.extend.pageInfo.pages
					                    + "页，总" + result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function () {
					to_page(1);
				});
				prePageLi.click(function () {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				lastPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function () {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function () {
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function () {
					to_page(item);
				});
				ul.append(numLi);
			})
			ul.append(nextPageLi).append(lastPageLi);
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增按钮，弹出模态框
		$("#emp_add_modal_btn").click(function () {
			//表单重置
			reset_form("#empAddModal form");
			//发送ajax请求，查出部门信息，显示在下拉列表中
			getDepts("#dept_add_select");
			
			//弹出模态框
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		
		//查出所有部门信息并显示在下拉列表中
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function (result){
					//在下拉列表中显示部门信息
					$.each(result.extend.depts, function () {
						var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		
		//校验员工姓名是否重复,发送ajax请求校验员工姓名是否可用
		$("#empName_add_input").change(function () {
			var empName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				data:"empName=" + empName,
				type:"POST",
				success:function (result){
					if (result.code == 100) {
						show_validate_msg("#empName_add_input", "success", "用户名可用");
						$("#emp_save_btn").attr("ajax-validate", "success");
					} else {
						show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-validate", "error");
					}
				}
			});
		});

		//校验员工表单数据
		function validate_add_form() {
			//校验员工姓名
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empName)) {
				show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者是6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#empName_add_input", "success", "");
			}
			
			//校验邮箱
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确！");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			return true;
		}

		//显示校验信息
		function show_validate_msg(ele, status, msg) {
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		//保存员工数据
		$("#emp_save_btn").click(function () {
			//对要提交的数据进行校验
			if (!validate_add_form()) {
				return false;
			};
			//判断之前的用户名重复检验是否成功
			if ($(this).attr("ajax-validate") == "error") {
				return false;
			}
			//发送ajax请求保存员工
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success:function (result){
					if (result.code) {
						//关闭模态框
						$("#empAddModal").modal("hide");
						//来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页
						to_page(totalRecord);
					} else {
						//显示失败信息
						if (undefined != result.extend.errorfields.email) {
							show_validate_msg("#email_add_input", "error", result.extend.errorfields.email);
						}
						if (undefined != result.extend.errorfields.empName) {
							show_validate_msg("#empName_add_input", "error", result.extend.errorfields.empName);				
						}
					}
					
				}
			});
		});
		
		//点击编辑按钮，弹出模态框，显示员工信息
		$(document).on("click", ".edit_btn", function () {
			getDepts("#empUpdateModal select");
			getEmp($(this).attr("edit-id"));
			$("#emp_update_btn").attr("save-id", $(this).attr("edit-id"))
			//弹出模态框
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		//获得单个员工数据并回显在修改模态框中
		function getEmp(id) {
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function (result){
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val([empData.gender]);
					$("#empUpdateModal select").val([empData.dId]);
				}
			});
		}
		
		//点击更新按钮，更新员工信息
		$("#emp_update_btn").click(function () {
			//校验邮箱
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_update_input", "error", "邮箱格式不正确！");
				return false;
			} else {
				show_validate_msg("#email_update_input", "success", "");
			}
			
			//发送ajax请求保存员工数据
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("save-id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				success:function (result){
					//关闭模态框
					$("#empUpdateModal").modal("hide");
					//回到本页面
					to_page(currentPage);
				}
			});
		});
	</script>
</body>
</html>