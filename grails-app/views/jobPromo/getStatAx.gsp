<div id="statsPlotDiv"></div>
<script>
var data={
	    label: "Job Promo stat",
	    data: ${stats}
};
var options = {
	    series: {
	      lines: { show: true },
	      points: { show: true }
	    }
	  };

	  $.plot($('#statsPlotDiv'), data, options);
</script>