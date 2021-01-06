function diy_output(tableId,aid,xlsName){

		    // 核心：拼接完整的html格式文档并填充数据
		    //使用outerHTML属性获取整个table元素的HTML代码， 包括根标签<table></table>
		    // 自定义封装html格式文档<html><head></head><body></body></html>
		    // 设置字符集，告诉浏览器以utf8方式解析，避免乱码<meta charset='utf-8'/>
		    // 获取table数据并填充到自定义的html格式文档中
		    var table_content =tableId.outerHTML;
		    var html = "<html><head><meta charset='utf-8' /></head><body>" + table_content + "</body></html>";
		    // 实例化一个Blob对象，
		    // param1：包含文件内容的数组，
		    // param2：包含文件类型属性的对象
		    var blob = new Blob([html], {
		        type: "application/vnd.ms-excel"
		    });
		    var output_table = aid;
		    // 利用URL.createObjectURL()方法为a元素生成blob URL
		    output_table.href = URL.createObjectURL(blob);
		    // 设置文件名，低级浏览器不支持
		    output_table.download = xlsName+".xls";
    	}