<!DOCTYPE HTML>
<html>
<head>
	<#include "common.ftl">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>3D柱状图</title>
</head>
<body>
<#include "commonHead.ftl">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 3D柱状图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div id="container" style="min-width:700px;height:400px"></div>
	<div id="container2" style="min-width:700px;height:400px"></div>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="${ctx}/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript">
﻿



// $(function () {
// 	$('#container').highcharts({
// 		chart: {
// 			type: 'column'
// 		},
// 		title: {
// 			text: 'Monthly Average Rainfall'
// 		},
// 		subtitle: {
// 			text: 'Source: WorldClimate.com'
// 		},
// 		xAxis: {
// 			categories: [
// 				'一月',
// 				'二月',
// 				'三月',
// 				'四月',
// 				'五月',
// 				'六月',
// 				'七月',
// 				'八月',
// 				'九月',
// 				'十月',
// 				'十一月',
// 				'十二月'
// 			]
// 		},
// 		yAxis: {
// 			min: 0,
// 			title: {
// 				text: 'Rainfall (mm)'
// 			}
// 		},
// 		tooltip: {
// 			headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
// 			pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
// 					'<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
// 			footerFormat: '</table>',
// 			shared: true,
// 			useHTML: true
// 		},
// 		plotOptions: {
// 			column: {
// 				pointPadding: 0.2,
// 				borderWidth: 0
// 			}
// 		},
// 		series: [{
// 			name: 'Tokyo',
// 			data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
//
// 		}]
// 	});
// });

$(function () {
	getinfo()
})




function getinfo() {








 	$.ajax({
		type:'POST',
		url:'${ctx}/chartp/info',
		dataType:'json',
		success:function(result){
			//console.log(result);
             var datax =[];
             var datay =[];

             var sbdata=[];
             var tbdata=[];

			for(var i=0;i<result.length;i++){
				datax.push(result[i].className);
				datay.push(result[i].mount);

				//饼
				sbdata.push(result[i].className);
				sbdata.push(result[i].mount);
				tbdata.push(sbdata);
				sbdata=[];


			}
			console.log(tbdata);




			//console.log(datax);
			//console.log(datay);

			$('#container').highcharts({
				chart: {
					type: 'column'
				},
				title: {
					text: '商品分类'
				},
				subtitle: {
					text: '数量详情'
				},
				xAxis: {
					categories: datax
				},
				yAxis: {
					min: 0,
					title: {
						text: '商品数量 (台)'
					}
				},
				tooltip: {
					headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
							'<td style="padding:0"><b>{point.y:.1f} 台</b></td></tr>',
					footerFormat: '</table>',
					shared: true,
					useHTML: true
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
				series: [{
					name: '各类商品数量',
					data: datay

				}]
			});





			//饼


			$('#container2').highcharts({
				chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false
				},
				title: {
					text: '商品比例分布'
				},
				tooltip: {
					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
							enabled: true,
							color: '#000000',
							connectorColor: '#000000',
							format: '<b>{point.name}</b>: {point.percentage:.1f} %'
						}
					}
				},
				series: [{
					type: 'pie',
					name: 'Browser share',
					data: tbdata
				}]
			});




		}
	})


 }


</script>

</body>
</html>