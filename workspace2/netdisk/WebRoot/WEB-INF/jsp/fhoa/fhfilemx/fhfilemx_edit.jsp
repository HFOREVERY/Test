<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="fhfilemx/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="FHFILEMX_ID" id="FHFILEMX_ID" value="${pd.FHFILEMX_ID}"/>
						<input type="hidden" name="FHFILE_ID" id="FHFILE_ID" value="${pd.FHFILE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">分享人:</td>
								<td><input type="text" name="SHARE_FROM" id="SHARE_FROM" value="${pd.SHARE_FROM}" maxlength="255" placeholder="这里输入分享人" title="分享人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">分享给谁:</td>
								<td><input type="text" name="SHARE_TO" id="SHARE_TO" value="${pd.SHARE_TO}" maxlength="255" placeholder="这里输入分享给谁" title="分享给谁" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">1:</td>
								<td><input type="text" name="OTHERS1" id="OTHERS1" value="${pd.OTHERS1}" maxlength="255" placeholder="这里输入1" title="1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">2:</td>
								<td><input type="text" name="OTHERS2" id="OTHERS2" value="${pd.OTHERS2}" maxlength="255" placeholder="这里输入2" title="2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">3:</td>
								<td><input type="text" name="OTHERS3" id="OTHERS3" value="${pd.OTHERS3}" maxlength="255" placeholder="这里输入3" title="3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">4:</td>
								<td><input type="text" name="OTHERS4" id="OTHERS4" value="${pd.OTHERS4}" maxlength="255" placeholder="这里输入4" title="4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#SHARE_FROM").val()==""){
				$("#SHARE_FROM").tips({
					side:3,
		            msg:'请输入分享人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SHARE_FROM").focus();
			return false;
			}
			if($("#SHARE_TO").val()==""){
				$("#SHARE_TO").tips({
					side:3,
		            msg:'请输入分享给谁',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SHARE_TO").focus();
			return false;
			}
			if($("#OTHERS1").val()==""){
				$("#OTHERS1").tips({
					side:3,
		            msg:'请输入1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHERS1").focus();
			return false;
			}
			if($("#OTHERS2").val()==""){
				$("#OTHERS2").tips({
					side:3,
		            msg:'请输入2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHERS2").focus();
			return false;
			}
			if($("#OTHERS3").val()==""){
				$("#OTHERS3").tips({
					side:3,
		            msg:'请输入3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHERS3").focus();
			return false;
			}
			if($("#OTHERS4").val()==""){
				$("#OTHERS4").tips({
					side:3,
		            msg:'请输入4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OTHERS4").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>