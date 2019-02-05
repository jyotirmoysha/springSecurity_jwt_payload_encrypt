function getHighchartsOptionsForPie(pieOpton,pieJsonData, chartContainer){
	if(pieJsonData.data == null || pieJsonData.data == '' || pieJsonData.data == undefined) {
		$("#"+chartContainer).html("No Data Found");		
		return;
	}
	
	var chart = new Highcharts.Chart({
        chart: {
        	type: pieOpton.chartType,
            inverted: pieOpton.inverted,
       	    backgroundColor: pieOpton.backGroundColor,
       	    renderTo: chartContainer,
       	    options3d: {
             enabled: pieOpton.enabledOptions3D,
             alpha: pieOpton.alphaOptions3D,
             beta: pieOpton.betaOptions3D
         }
          },
        title: {
            text: pieOpton.titleText,
            x: pieOpton.xTitle
        },
        exporting:false,
        tooltip: {
            //pointFormat: pieOpton.pointformat
         	 pointFormat: '{series.name}: <b>{point.percentage:"'+pieOpton.pointformat+'"f}'+pieOpton.suffixValueTooltip+'</b>'
        },
        plotOptions: {
            pie: {
                 cursor: 'pointer',
                 depth: pieOpton.depth,
                 size:pieOpton.chartSize,
               //  allowPointSelect: true,
                dataLabels: {
                	enabled: pieOpton.enabledDataLabels,
                	 format: '{point.name}: <b>{point.percentage:"'+pieOpton.pointformat+'"f}'+pieOpton.suffixValueTooltip+'</b>',
                	 style: {
                         color:pieOpton.colorDataLabels,
                         fontWeight: pieOpton.fontWeight
                       },
                      connectorColor: pieOpton.connectorcolor
                                                             
                },
                showInLegend: pieOpton.showInLegend
              }	       
        
        },
        legend: {
            layout: pieOpton.layoutLegend,
            align: pieOpton.alignLegend,
            verticalAlign: pieOpton.verticalAlignLegend,
            floating: false,
            backgroundColor: pieOpton.backgroundColorLegend,
            borderColor: pieOpton.borderColorLegend,
            borderWidth:pieOpton.borderWidthLegend,
            x: pieOpton.legendX,
            y: pieOpton.legendY
            
                       
        },
        
        series: [{point: {
        	events: {
        		click: function () {

        			var url = this.options.url[0];
        			if(url !== null && url !== "" && url !== undefined  && url !== ''){
        				if(this.options.urlTargetNewPage == "Y"){
        					window.open(url);
        				}
        				else{
        					if(url.indexOf('javascript') == 0){
        						url = url.split(":")[1];    
        						eval(url);
        					} else {
        						location.href = url;
        					}                  		  
        				}
        			}

        		}
        	}
        },
            name: pieOpton.name,
            data: pieJsonData.data
        }]
    });
	
}

function getHighchartsOptionsForGroupedBar(option,JsonData, chartContainer){
	if(JsonData.data == null || JsonData.data == '' || JsonData.data == undefined) {
		$("#"+chartContainer).html("No Data Found");		
		return;
	}
	var chart = new Highcharts.Chart({

	        chart: {
	        	type: option.barType,
	            inverted: option.inverted,
	            renderTo: chartContainer,
	            backgroundColor: option.backGroundColor
	            
	        },
	        title: {
	            text: option.titleText,
	            x: option.xTitle
	        },
	        subtitle: {
	            text: option.subtitleText,
	            x: option.xSubTitle
	        },
	        xAxis: {
	            categories:option.xAxisCategories
	        },
	        yAxis: {
	           // min: option.yAxisMin,
	            title: {
	                text: option.yAxisTitle
	            },
	            
	        },
	        tooltip: {
	         	 pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:"'+option.pointformat+'"f} '+option.suffixValueTooltip+'</b></td></tr>',
	    		 crosshairs: option.crosshair
	        },
	       
	        plotOptions: {
	            column: {
	            	pointPadding:option.pointPadding,
	                borderWidth: 0,
	                cursor: 'pointer',
	                showInLegend : option.showInLegend,
	               
	                point: {
	                	events: {
	                		click: function () {
	                			var url = this.series.options.url[this.x];
	                			if(url !== null && url !== "" && url !== undefined  && url !== ''){
	                				if(this.series.options.urlTargetNewPage == "Y"){
	                					window.open(url);
	                				}
	                				else{
	                					if(url.indexOf('javascript') == 0){
	                						url = url.split(":")[1];    
	                						eval(url);
	                					} else {
	                						location.href = url;
	                					}                  		  
	                				}
	                			}
	                		}
	                	}
	                }
	            },
	            bar: {
	            	pointPadding:option.pointPadding,
	                borderWidth: 0,
	                cursor: 'pointer',
	                showInLegend : option.showInLegend,
	               
	                point: {
	                	events: {
	                		click: function () {
	                			var url = this.series.options.url[this.x];
	                			if(url !== null && url !== "" && url !== undefined  && url !== ''){
	                				if(this.series.options.urlTargetNewPage == "Y"){
	                					window.open(url);
	                				}
	                				else{
	                					if(url.indexOf('javascript') == 0){
	                						url = url.split(":")[1];    
	                						eval(url);
	                					} else {
	                						location.href = url;
	                					}                  		  
	                				}
	                			}
	                		}
	                	}
	                }
	            }
	        },
	        legend: {
	        	    align: option.alignLegend,
		            verticalAlign: option.verticalAlignLegend,
		            floating: false,
		            backgroundColor: option.backgroundColorLegend,
		            borderColor: option.borderColorLegend,
		            borderWidth:option.borderWidthLegend,
		            layout: option.layoutLegend,
		            x: option.legendX,
		            y: option.legendY
	           
	        },
	        series:JsonData.data
	       
	   
	    });
	
}

function getHighchartsOptionsForStackedBar(option,JsonData, chartContainer){
	if(JsonData.data == null || JsonData.data == '' || JsonData.data == undefined) {
		$("#"+chartContainer).html("No Data Found");		
		return;
	}
	var chart = new Highcharts.Chart({
	        chart: {
	        	type: option.barType,
	            inverted: option.inverted,
	            renderTo: chartContainer,
	            backgroundColor: option.backGroundColor
	        },
	        title: {
	            text: option.titleText,
	            x: option.xTitle
	        },
	        xAxis: {
	            categories: option.xAxisCategories
	        },
	        yAxis: {
	           // min: option.yAxisMin,
	            title: {
	                text: option.yAxisTitle
	               
	            },
	            stackLabels: {
	                enabled: option.enabledStackLabels,
	                style: {
	                    fontWeight: option.fontWeight,
	                    color: option.stackLabelColor
	                }
	            }
	        },
	        legend: {
	            align: option.alignLegend,
	            verticalAlign: option.verticalAlignLegend,
	            floating: false,
	            backgroundColor: option.backgroundColorLegend,
	            borderColor: option.borderColorLegend,
	            borderWidth:option.borderWidthLegend,
	            layout: option.layoutLegend,
	            x: option.legendX,
	            y: option.legendY
	         },
	        tooltip: {
	            formatter: function () {
	                 return '<b>' + this.x + '</b><br/>' +
	                    this.series.name + ': ' + this.y + '<br/>' +
	                    'Total: ' + this.point.stackTotal;
	            },
				crosshairs: option.crosshair
	        },
	        plotOptions: {
	            column: {
	                stacking: 'normal',
	                showInLegend : option.showInLegend,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: option.enabledDataLabels,
	                    color: option.colorDataLabels
	                      },
	                point: {
	                	events: {
	                		click: function () {

	                			var url = this.series.options.url[this.x];
	                			if(url !== null && url !== "" && url !== undefined  && url !== ''){
	                				if(this.series.options.urlTargetNewPage == "Y"){
	                					window.open(url);
	                				}
	                				else{
	                					if(url.indexOf('javascript') == 0){
	                						url = url.split(":")[1];    
	                						eval(url);
	                					} else {
	                						location.href = url;
	                					}                  		  
	                				}
	                			}
	                		}
	                	}
                     }
	            },
	            bar: {
	                stacking: 'normal',
	                showInLegend : option.showInLegend,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: option.enabledDataLabels,
	                    color: option.colorDataLabels
	                      },
	                point: {
	                	events: {
	                		click: function () {

	                			var url = this.series.options.url[this.x];
	                			if(url !== null && url !== "" && url !== undefined  && url !== ''){
	                				if(this.series.options.urlTargetNewPage == "Y"){
	                					window.open(url);
	                				}
	                				else{
	                					if(url.indexOf('javascript') == 0){
	                						url = url.split(":")[1];    
	                						eval(url);
	                					} else {
	                						location.href = url;
	                					}                  		  
	                				}
	                			}
	                		}
	                	}
                     }
	            }
	        },
	      
	        series:JsonData.data
	    });
}

function getHighchartsOptionsForBasicBar(option,JsonData, chartContainer){
	
	if(JsonData.data == null || JsonData.data == '' || JsonData.data == undefined) {
		$("#"+chartContainer).html("No Data Found");		
		return;
	}
	var chart = new Highcharts.Chart({
					 
			        chart: {
			        	type: option.barType,
			            inverted: option.inverted,			            
			            renderTo: chartContainer,
			            backgroundColor: option.backGroundColor
			        },
			        title: {
			            text: option.titleText,
			            x: option.xTitle 
			        },
			        subtitle: {
			            text: option.subtitleText,
			            x: option.xSubTitle
			        },
			        xAxis: {
			            type: 'category',
			             labels: {
			                rotation: option.rotationLabelsXAxis
			             }
			        },
			        yAxis: {
			            //min:option.yAxisMin,
			            title: {
			                text: option.yAxisTitle
			            }
			        },
			       
			        tooltip: {
			           	pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:"'+option.pointformat+'"f}'+option.suffixValueTooltip+'</b></td></tr>',
						crosshairs: option.crosshair
			            },
			            
			        plotOptions: {
			        	bar: {
			                showInLegend : option.showInLegend,
			                pointPadding:option.pointPadding,
			              //  pointWidth: 50,
			               // pointPadding: 1,
			                cursor: 'pointer',
			                dataLabels: {
			                	 enabled: option.enabledDataLabels,
					             color: option.colorDataLabels,
					             align: 'center',
					             y: 0
					             
			                   
			                },
			              
			                point: {
			                	events: {
			                		click: function () {
			                			var url = this.options.url[0];
			                			if(url !== null && url !== "" && url !== undefined  && url !== ''){
			                				if(this.options.urlTargetNewPage == "Y"){
			                					window.open(url);
			                				}
			                				else{
			                					if(url.indexOf('javascript') == 0){
			                						url = url.split(":")[1];    
			                						eval(url);
			                					} else {
			                						location.href = url;
			                					}                  		  
			                				}
			                			}
			                		}
			                	}
			                }
			            },
			        	
			            column: {
			                showInLegend : option.showInLegend,
			                pointPadding:option.pointPadding,
			              //  pointWidth: 50,
			               // pointPadding: 1,
			                cursor: 'pointer',
			                dataLabels: {
			                	 enabled: option.enabledDataLabels,
					             color: option.colorDataLabels,
					             align: 'center',
					             y: 0
					             
			                   
			                },
			              
			                point: {
			                	events: {
			                		click: function () {
			                			var url = this.options.url[0];
			                			if(url !== null && url !== "" && url !== undefined  && url !== ''){
			                				if(this.options.urlTargetNewPage == "Y"){
			                					window.open(url);
			                				}
			                				else{
			                					if(url.indexOf('javascript') == 0){
			                						url = url.split(":")[1];    
			                						eval(url);
			                					} else {
			                						location.href = url;
			                					}                  		  
			                				}
			                			}
			                		}
			                	}
			                }
			            }
			        },
			        legend: {
			        	    align: option.alignLegend,
				            verticalAlign: option.verticalAlignLegend,
				            floating: false,
				            backgroundColor: option.backgroundColorLegend,
				            borderColor: option.borderColorLegend,
				            borderWidth:option.borderWidthLegend,
				            layout: option.layoutLegend,
				            x: option.legendX,
				            y: option.legendY
			           
			        },
			        series: [{
			        	name: option.name,
			            data: JsonData.data
			          }]
			        
			        
			        
			        
			    });
	 
			
}

function getHighchartsOptionsForLine(option,JsonData, chartContainer){
	
	if(JsonData.data == null || JsonData.data == '' || JsonData.data == undefined) {
		$("#"+chartContainer).html("No Data Found");		
		return;
	}

	var chart = new Highcharts.Chart({
		chart: {
            type: 'line',
            renderTo: chartContainer,
            backgroundColor: option.backGroundColor
        },
		title: {
			text: option.titleText,
			x: option.xTitle 
		},
		subtitle: {
			text: option.subtitleText,
			x: option.xSubTitle
		},
		xAxis: {
			categories:option.xAxisCategories
		},
		yAxis: {
			title: {
				text: option.yAxisTitle
			},

		},
		tooltip: {
			valueSuffix: option.suffixValueTooltip,
			crosshairs: option.crosshair
		},
		legend: {
			align: option.alignLegend,
			verticalAlign: option.verticalAlignLegend,
			floating: false,
			backgroundColor: option.backgroundColorLegend,
			borderColor: option.borderColorLegend,
			borderWidth:option.borderWidthLegend,
			layout: option.layoutLegend,
			x: option.legendX,
			y: option.legendY

		},
		plotOptions: {
			line: {
				cursor: 'pointer',
				showInLegend : option.showInLegend,
				dataLabels: {
					enabled: option.enabledDataLabels
				},
				point: {
					events: {
						click: function () {

							var url = this.series.options.url[this.x];
							if(url !== null && url !== "" && url !== undefined  && url !== ''){
								if(this.series.options.urlTargetNewPage == "Y"){
									window.open(url);
								}
								else{
									if(url.indexOf('javascript') == 0){
										url = url.split(":")[1];    
										eval(url);
									} else {
										location.href = url;
									}                  		  
								}
							}
						}
					}
				}
			}
		},
		series:JsonData.data
	});

}

function chartCollapseExpands(tableId) { 
	var accordId = "#uic_chart_AccordianId_"+tableId;
	var mainDivId = "#uic_chart_MainDiv_"+tableId;
	if($(accordId).hasClass("uic_collapseTable")) {
		$(accordId).removeClass("uic_collapseTable");
		$(accordId).addClass("uic_expandTable");
		$(mainDivId).hide();
	}
	else if($(accordId).hasClass("uic_expandTable")) {
		$(accordId).removeClass("uic_expandTable");
		$(accordId).addClass("uic_collapseTable");
		$(mainDivId).show();	
	}
} 


//=========== new code added by murthy=======

function showChartOfUIC(dataObj, destnation){
	  
	  jQuery.ajax({
	      url : "showChart.htm",
	      type : 'POST',
	      dataType: "json",
	      data : dataObj,
	      cache : false,
	      error : function(error) {
	      // alert('An error occurred while loading page, please try again.');
	    	  $.alert({
	  		    title: 'Confirm!',
	  		    content: 'An error occurred while loading page, please try again.',
	  		    confirmButtonClass: 'UicPrimaryBtn',
	  		    closeIcon: true,
	  		    columnClass: 'col-md-4 col-md-offset-4',
	  		});
	      },
	      success : function(data) {
	    	  var jsonStr = JSON.stringify(data);
	       loadChart(jsonStr, destnation);
	      },
	     });

	 }
	    
	 function loadChart(jsonStr, destnation){
	   
	     var obj = {};
	     try {
	      obj = jQuery.parseJSON(jsonStr);
	     } catch (e) {
	      console.log(e);
	     }
	     var isAccordian = obj.chartComponent.isAccordian;
	     if (isAccordian == 'N') {
	      $(".uic_custom_btn_right").hide();
	     }

	     getChart(obj, destnation);
	  }

	  function getChart(obj, destnation) {
	    if (obj.chartComponent.chartType == 'pie') {
	       getHighchartsOptionsForPie(obj.chartComponent, obj.chartAttribute, destnation);
	     } else if (obj.chartComponent.chartType == 'groupedBar') {
	       getHighchartsOptionsForGroupedBar(obj.chartComponent, obj.chartAttribute, destnation);
	     } else if (obj.chartComponent.chartType == 'stackedBar') {
	       getHighchartsOptionsForStackedBar(obj.chartComponent, obj.chartAttribute, destnation);
	     } else if (obj.chartComponent.chartType == 'basicBar') {
	       getHighchartsOptionsForBasicBar(obj.chartComponent, obj.chartAttribute, destnation);
	     } else if (obj.chartComponent.chartType == 'line') {
	       getHighchartsOptionsForLine(obj.chartComponent, obj.chartAttribute, destnation);
	     } else if (obj.chartComponent.chartType == 'donutChart') {	    	 
	    	 getHighchartsOptionsForDonutChart(obj.chartComponent, obj.chartAttribute, destnation);
	     }
	  }
	  
	  function getHighchartsOptionsForDonutChart(donutOption,pieJsonData,chartContainer){		  
		  if(pieJsonData.data == null || pieJsonData.data == '' || pieJsonData.data == undefined) {
				$("#"+chartContainer).html("No Data Found");		
				return;
			}		
		  	var chart = $('#'+chartContainer).highcharts({
		  	//var chart = new Highcharts.Chart({
		        chart: {
		        	type: 'pie',		            
		       	    backgroundColor: donutOption.backGroundColor,
		       	    options3d: {
		             enabled: donutOption.enabledOptions3D,
		             alpha: donutOption.alphaOptions3D,
		             beta: donutOption.betaOptions3D
		         }
		          },
		        title: {
		            text: donutOption.titleText,
		            x: donutOption.xTitle
		        },
		        tooltip: {		            
		        	 pointFormat: '{series.name}: <b>{point.percentage:"'+donutOption.pointformat+'"f}%</b>'
		         	
		        },
		        plotOptions: {
		            pie: {
		            	 innerSize: donutOption.innerSize,
		                 cursor: 'pointer',
		                 depth: donutOption.depth,
		                 size: donutOption.chartSize,
		                 dataLabels: {
		                	enabled: donutOption.enabledDataLabels,
		                   backgroundColor: 'rgba(252, 255, 197, 0.7)',
		                     borderWidth: 1,
		                     borderColor: '#AAA',
		                  	 format: '{point.name}: <b>{point.percentage:"'+donutOption.pointformat+'"f}%</b>',
		                	 style: {
		                         color:donutOption.colorDataLabels,
		                         fontWeight: donutOption.fontWeight
		                       },
		                     connectorColor: donutOption.connectorcolor, 
		                },
		                //startAngle: 180,
		                //endAngle: -180,
		                //center: ['20%', '50%'],
		                showInLegend: donutOption.showInLegend
		              }	,       
		              series: {
		                  cursor: 'pointer',
		                  point: {
		                      events: {
		                          click: function(event) {			                            
			                             var url = this.options.url[0];
			  		                	
			  		                	if(url !== null && url !== "" && url !== undefined  && url !== ''){
			  		                	
			  		                	if(this.options.urlTargetNewPage == "Y"){
			  		                		window.open(url);
			  		                	}
			  		                	else{
			  		                  		 location.href = url;
			  		                	}
			  		                 }
		                          }
		                      }
		                  }
		              }
		        },
		        legend: {
		            layout: donutOption.layoutLegend,
		            align: donutOption.alignLegend,
		            verticalAlign: donutOption.verticalAlignLegend,
		            floating: false,
		            backgroundColor: donutOption.backgroundColorLegend,
		            borderColor: donutOption.borderColorLegend,
		            borderWidth:donutOption.borderWidthLegend,
		            x: donutOption.legendX,
		            y: donutOption.legendY
		                       
		        },  
		        		        
		        series: pieJsonData.series
		    });
		  	
		}

