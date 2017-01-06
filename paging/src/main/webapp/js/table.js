$(function() {
	$(".row_cont dl").each(function(){
		var row_warp=$(this).find("dd").height(),
			row_cont=$(this).find("p").height();
		if (row_warp < row_cont ){
			//alert(row_warp+" + "+row_cont );
			$(this).find("dd").append('<a class="t_more">更多 &gt;</a><a class="t_less hide">收起 &gt;</a>');
		}else {}
	});
	$(".row_cont dl p").on("click","a",function(){
		var classNa = $(this).attr("class");
		if (classNa=="opt"){
				/*$(this).removeClass("opt");*/
			}else{
				$(this).parent().find("a").removeClass("opt");
				$(this).addClass("opt");
			}
		});
		$(".t_less").addClass("hide");
		$(".t_more").click(function(){
		$(this).addClass("hide");
		$(this).parent().find(".t_less").removeClass("hide");
		$(this).parent().height("auto");
		return false;
	});
	$(".t_less").click(function(){
		$(this).addClass("hide");
		$(this).parent().find(".t_more").removeClass("hide");
		$(this).parent().height(37);
		return false;
	});
	
});