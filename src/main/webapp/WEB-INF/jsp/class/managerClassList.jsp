<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/jsp/common/common-index-title.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="tree">
					<ul style="padding-left:0px;" class="list-group">
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon glyphicon-user"></i> 用户管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/student/studentList"><i class="glyphicon glyphicon-user"></i> 学生管理</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/teacher/teacherList"><i class="glyphicon glyphicon-king"></i> 教师管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 试卷管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/paper/paperList"><i class="glyphicon glyphicon-check"></i> 试卷列表</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/paper/importPaper"><i class="glyphicon glyphicon-check"></i> 导入试卷</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 题库管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemList"><i class="glyphicon glyphicon-check"></i> 试题列表</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/manager/itemBank/itemAdd"><i class="glyphicon glyphicon-check"></i> 添加试题</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-ok"></i> 成绩管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/grade/allGrade"><i class="glyphicon glyphicon-check"></i> 学生成绩查看</a></li>
								<li style="height:30px;"><a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 成绩单打印</a></li>
							</ul></li>
						<li class="list-group-item "><span><i class="glyphicon glyphicon-ok"></i> 学年管理 <span class="badge" style="float:right">3</span></span>
							<ul style="margin-top:10px;">
								<li style="height:30px;"><a href="${APP_PATH}/major/majorList"><i class="glyphicon glyphicon-check"></i> 专业管理</a></li>
								<li style="height:30px;"><a href="${APP_PATH}/class/managerClassList" style="color: red;"><i class="glyphicon glyphicon-check"></i> 班级管理</a></li>
							</ul></li>
						<li class="list-group-item tree-closed"><span><i class="glyphicon glyphicon-th-large"></i> 学科管理 <span class="badge" style="float:right">7</span></span>
							<ul style="margin-top:10px;display:none;">
								<li style="height:30px;"><a href="${APP_PATH}/course/courseList"><i class="glyphicon glyphicon-picture"></i> 科目管理</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 班级列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询班级</div>
									<input class="form-control has-success" id="queryText" type="text" placeholder="输入班级编号">
								</div>
							</div>
							<button type="button" class="btn btn-warning" id="queryButton">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th>班级编号</th>
										<th>班级名称</th>
										<th>所属教师</th>
										<th>创建时间</th>
										<th style="width: 45px;">操作</th>
									</tr>
								</thead>
								<tbody id="dataBody"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			pageQuery();
		})
	
		function pageQuery(queryText) {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/class/managerClassList/doPageQuery",
				data : {
					"queryText" : queryText,
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						var datas = result.data;
						var context = ""
						for (var i = 0; i < datas.length; i++) {
							var data = datas[i];
							context += '<tr>';
							context += '	<td>' + (i + 1) + '</td>';
							context += '	<td>' + data.claId + '</td>';
							context += '	<td>' + data.claName + '</td>';
							context += '	<td>' + data.teaId + '</td>';
							context += '	<td>' + data.createTime + '</td>';
							context += '	<td>';
							context += '		<button type="button" class="btn btn-danger btn-xs" onclick="deleteClass(\''
								+ data.claId + '\')">';
							context += '			<i class=" glyphicon glyphicon-remove"></i>';
							context += '		</button>';
							context += '	</td>';
							context += '</tr>';
						}
						$("#dataBody").html(context);
					} else {
						layer.msg("页面加载失败", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {});
					}
				}
			});
		}
	
		function deleteClass(classId) {
			layer.confirm("您确认要删除吗？", {
				icon : 3,
				title : '提示'
			}, function(cindex) {
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/class/classList/doDeleteClass",
					data : {
						"classId" : classId
					},
					beforeSend : function() {
						index = layer.load(2, {
							time : 10 * 1000
						});
					},
					success : function(result) {
						layer.close(index);
						if (result.success) {
							layer.msg("删除成功", {
								time : 2000,
								icon : 6,
							}, function() {
								pageQuery();
							});
						} else {
							layer.msg("删除失败,该班级可能包含学生", {
								time : 2000,
								icon : 5,
								shift : 6
							}, function() {});
						}
					}
				});
				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	
		$("#queryButton").click(function() {
			pageQuery($("#queryText").val())
		});
	</script>
</body>
</html>
