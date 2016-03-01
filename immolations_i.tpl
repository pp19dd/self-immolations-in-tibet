{*
	slides[0] = array(
		[0] => "Nov. 02, 2012"
		[1] => "current Zhou Yongkang"
		[6] => "pic + bio"
	)

*}

{capture assign=css}

<style type="text/css">

/* claim wide area */

.main-content { background-color: black; }
h2.sitetitle { display: none !important }
#content_top_bar { display: none !important }
.article_txt_intro { display: none !important }
.toplinks { display: none !important }
#mainMediaBig { display: none !important }
.articleLeftContainer { display: none !important }
.dateblock { display: none !important }
#article h1 { display: none !important }
.article_comments { background-color: white; padding:5px; }
.footerlinks a { color: silver }

/* project */

#immolation_project {
    background-color: black;
    color: #DDDDDD;
/*
    background-image:url(http://www.voanews.com/MediaAssets2/english/2013_05/Backgroung-final.jpg);
    background-image:url(http://www.voanews.com/MediaAssets2/english/2013_05/Tibet-Doc---Web-Page-Version-05-no-dots.jpg);
*/
    width:100%;
}

.immolation_project_section_1 {
    background-image:url(http://www.voanews.com/MediaAssets2/english/2013_05/Tibet-Web-Page-Version-dots-left.jpg);
    background-position: top center;
    background-repeat: no-repeat;
}



/*
#immolation_project img.alignright { text-align: right }
#immolation_project img.alignleft { text-align: left }
#immolation_project img.aligncenter { text-align: center}
*/

#immolation_project_top_left { width: 85%; }
@media (min-width:370px) { #immolation_project_top_left { width: 75%; } }
@media (min-width:500px) { #immolation_project_top_left { width: 70%; } }
@media (min-width:630px) { #immolation_project_top_left { width: 60%; } }
@media (min-width:1200px) { #immolation_project_top_left { width: 55%; } }


#immolation_project_top_left p {
	font-size:14px;
	color: silver;
}
#immolation_project_top_right {
	float: right;
	width: 370px;
	/* padding-top: 270px; */
}
#immolation_project_top_left em, #immolation_project_top_right em {
	font-weight: bold;
	color: white;
}
#immolation_project_top_right p {
    color: silver;
    margin-left: 10px;
    padding: 5px;
    width: 290px;
	font-size:14px;
}

#immolation_project_title h2, #immolation_project_title h2 a, #immolation_project_title h3, #immolation_project_title h3 a {
	font-family: Impact;
    font-size: 38px;
    font-weight: normal !important;
    line-height: 30px;
    padding-top: 10px;
    text-align: right;
	background-image: none !important;
	font-style: normal;
}

#immolation_project_title h2, #immolation_project_title h2 a {
	color: #d70a05;
}
#immolation_project_title h3, #immolation_project_title h3 a {
	color: #fcfafb;
}

#immolation_project_title a:hover {
	text-decoration: underline;
	color: silver;
}

#immolation_project_video {
	/* height:400px; */
}

#immolation_project_video a { display: none }
#immolation_project_video object {
	margin-left:0px !important;
}
#immolation_project_subhead {
	margin-top:15px;
}
#immolation_project_subhead a { color: silver; font-size:12px }
#immolation_project_subhead td { vertical-align: top; padding:5px }


.immolation_project_section {
	/* margin-left:60px; */
	clear: both;
	/* margin-top:45px; */
}
.immolation_project_section_1 { margin-top:0px}

.immolation_project_section h3, .immolation_project_section h4 {
    background-image: url(http://www.voanews.com/MediaAssets2/english/2013_05/Red-line-experts.png);
    background-repeat: no-repeat;
    color: white !important;
    font-size: 14px;
    font-style: oblique;
    font-weight: bold;
    min-height: 27px;
    padding-left: 5px;
}

.immolation_project_section h4 {
    background-image: url(http://www.voanews.com/MediaAssets2/english/2013_05/Resources-red-line.png);
}

/* insert from im.css */


.immolation_project_container {

/*
    background-image:url(http://www.voanews.com/MediaAssets2/english/2013_05/Backgroung-final.jpg);
    background-image:url(http://www.voanews.com/MediaAssets2/english/2013_05/Tibet-Doc---Web-Page-Version-05-no-dots.jpg);
    background-image:url(http://www.voanews.com/MediaAssets2/english/2013_05/Tibet-Web-Page-Version-dots-left.jpg);
*/
    background-repeat: no-repeat;
    width:100%;
}

/*
#div_t_i_container { width: 100%; overflow: hidden }
*/
.immolation_project_container { font-family: Arial }


#div_t_i_container { display: block }

.t_i_v {
	float: left;
	width:150px;
	/*height:150px;*/
	margin:5px;
	border:1px solid silver;
	/*overflow: hidden;*/
	background-color: white;
	color: black;
}


.t_i_click {
	cursor: pointer;
	border-radius:3px;
	background-color:silver;
}

.t_i_n { font-family: Arial; font-size:12px; text-align: center; padding:4px; background-color: black; color:white;}
.t_i_v_tip { background-color:black;color:silver; padding:10px }

#immolation_map_canvas { width:100%; height:270px }
#control {
	float: left;
	width:322px;
	height:434px;
	background-color: rgb(80,80,80);
	margin-right:5px;
}

.edata { padding:5px }
.eloca, .ecurr { font-family: Arial; font-size: 12px }
.ecurr { margin-bottom:10px; color: crimson; font-weight: bold; line-height: 1.1em; }
.eloca { color: #323232; font-weight: bold; margin-bottom:10px; line-height: 1.1em; }
.ebio { line-height: 1.1em; font-size:12px; /* height:100px; overflow-y: auto; position: absolute */ }

/* Start: Recommended Isotope styles */

/**** Isotope Filtering ****/

.isotope-item {
  z-index: 2;
}

.isotope-hidden.isotope-item {
  pointer-events: none;
  z-index: 1;
}

.tables_can_help { border-collapse: collapse }
.tables_can_help td { vertical-align: top }


/**** Isotope CSS3 transitions ****/

.isotope,
.isotope .isotope-item {
  -webkit-transition-duration: 0.8s;
     -moz-transition-duration: 0.8s;
      -ms-transition-duration: 0.8s;
       -o-transition-duration: 0.8s;
          transition-duration: 0.8s;
}

.isotope {
  -webkit-transition-property: height, width;
     -moz-transition-property: height, width;
      -ms-transition-property: height, width;
       -o-transition-property: height, width;
          transition-property: height, width;
}

.isotope .isotope-item {
  -webkit-transition-property: -webkit-transform, opacity;
     -moz-transition-property:    -moz-transform, opacity;
      -ms-transition-property:     -ms-transform, opacity;
       -o-transition-property:      -o-transform, opacity;
          transition-property:         transform, opacity;
}

/**** disabling Isotope CSS3 transitions ****/

.isotope.no-transition,
.isotope.no-transition .isotope-item,
.isotope .isotope-item.no-transition {
  -webkit-transition-duration: 0s;
     -moz-transition-duration: 0s;
      -ms-transition-duration: 0s;
       -o-transition-duration: 0s;
          transition-duration: 0s;
}

/* End: Recommended Isotope styles */

#immolation_map_histogram {
/*
	margin-top:5px;
	margin-bottom:5px;
*/
	width:647px;
	height:80px;
	background-color: #505050;
}

.tables_can_help {
	background-color: black;
	border-top:10px solid black;
	border-bottom:10px solid black;
}

#immolation_map_histogram_note {}
.immolation_disclaimer {
	margin-top:10px;
}

.project_note {
	background-color: #505050;
	border-bottom:10px solid black;
}

.project_note_inner {
	/* color: rgb(130,130,130); */

	color: black;
	font-weight: bold;

	text-align: center;
	padding:5px;
	font-size:12px !important;
}

.preset { border-right: 1px dotted gray }
.preset_last { border-right: 0px }
.preset a { text-decoration: underline }
.preset a:hover { color: white !important }
.preset a { display: block; width: 135px }

.active_preset {
	background-color: #60675A;
	color: black;
}
.active_preset a {
	color: black !important;
}

/* -------------------------- active tile -------------------------- */

.selected_person * { background-color: #A2C180 !important; }
.selected_person .t_i_n { color: black; }

/* -------------------------- tile mouseover -------------------------- */

.t_i_v_has_position_info { cursor: pointer }

.t_i_v_has_position_info_hover { background-color: #A2C180 }

.t_i_v_has_position_info_hover img { opacity: 0.5 }
.t_i_v_has_position_info_hover .t_i_n { background-color: rgb(80,80,80) }
.t_i_v_has_position_info_hover .ecurr { color: red }
.t_i_v_has_position_info_hover .ebio {  }



{$options->additional_css}

</style>

{/capture}

{capture assign=html}

<div id="immolation_project">
	<div class="immolation_project_section immolation_project_section_1">
		<div id="immolation_project_top_right">
			{$slides[3][6]}
		</div>
		<div id="immolation_project_top_left">
			<div id="immolation_project_title">
				<a href="{$slides[7][6]|trim|strip_tags}">
					<h2>{$slides[0][1]}</h2>
					<h3>{$slides[1][1]}</h3>
				</a>
			</div>
			<div id="immolation_project_subhead">
				{$slides[2][6]}

				<table width="100%">
					<tbody>
						<tr>
							<td style="width: 25%;" class="preset" id="preset_1"><a href="javascript:immolation_project.preset(1)">{$slides[8][6]|strip_tags}</a></td>
							<td style="width: 25%;" class="preset" id="preset_2"><a href="javascript:immolation_project.preset(2)">{$slides[9][6]|strip_tags}</a></td>
							<td style="width: 25%;" class="preset" id="preset_3"><a href="javascript:immolation_project.preset(3)">{$slides[10][6]|strip_tags}</a></td>
							<td style="width: 25%;" class="preset preset_last" id="preset_4"><a href="javascript:immolation_project.preset(4)">{$slides[11][6]|strip_tags}</a></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>

	<div class="immolation_project_section immolation_project_section_2">

		<div class="immolation_project_container">

			<table width="100%" class="tables_can_help">
				<tbody>
					<tr>
						<td style="width:322px">
							<div id="control"></div>
						</td>
						<td>
							<div id="immolation_map_histogram"></div>
							<div class="project_note" id="immolation_map_histogram_note">
								<div class="project_note_inner" id="immolation_map_histogram_note_text">
									{$slides[5][6]|strip_tags}
								</div>
							</div>

							<div id="immolation_map_canvas"></div>

							<div class="immolation_disclaimer project_note">
								<div class="project_note_inner" id="immolation_disclaimer_text">
									{$slides[4][6]|strip_tags}
								</div>
							</div>

						</td>
					</tr>
				</tbody>
			</table>

			<div style="clear:both"></div>

			<!--<script type="text/javascript" src="immolations.js"></script>-->

			<div id="div_t_i_container">
				<div id="div_t_i"></div>
			</div>

		</div>




	</div>

	<div class="immolation_project_section immolation_project_section_3">

	</div>

</div>

{/capture}

{*<script type="text/javascript">*}


var immolation_project = {
	key: '{$slides[6][1]|trim}',
	translations: {$translations|json_encode},
	map: null,
	data: {},
	filters: { },
	markers: [],
	markers_lookup: {},
	control_indicators: {
		yearmonthformula: {},
		gender: {},
		agegroup: {},
		dayofweekformula: {}
	},
	animation_length: 300,
	marker_update_interval: 750,
	canvas_left: { paper: null, width: 322, height:434 },
	canvas_top: { paper: null, width: 640, height:80 },
	styles: {
		selected_bar: { fill: '#F6F1DC' },
		histogram_bar: { fill: '#A2C180', stroke: '#505050' },
		selected_bar_label: { fill: '#F6F1DC' },
		histogram_bar_label: { fill: 'black' },
		shadow_bar: { fill: '#60675A' },
		histogram_text: { fill: 'rgb(130,130,130)' },
		histogram_year_line: { stroke: 'rgb(130,130,130)' },
		histogram_count: { fill: 'black', 'font-size': 12, 'font-weight': 'bold' },
		labels: { 'font-size': 13, fill: 'black' },
		labels_l: { 'text-anchor': 'start' },
		labels_r: { 'text-anchor': 'end' },
	},
	map_options: {
		zoom: 4,
		center: new google.maps.LatLng(35.269, 98.263),
		scrollwheel: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		maxZoom: 10
	},
	cluster_options: {
		maxZoom: 9,
		minimumClusterSize: 2,
		zoomOnClick: false
	},
	field_counts: { },
	histogram: {},

	// returns a translation, if one exists - otherwise key from google spreadsheet
	__: function( k ) {

		if( typeof( this.translations[k] ) == 'undefined' ) {
			return( k );
		} else {
			return( this.translations[k] );
		}
	},

	preset: function( num ) {

		$(".preset").removeClass("active_preset");

		switch( num ) {
			case 1: immolation_project.activate_filter({ group:'gender', selector:'.gender_female', english: 'Female'}, true); break;
			case 2: immolation_project.activate_filter({ group:'year-month', selector:'.year_month_2012-11', english: 'November 2013'}, true); break;
			case 3: immolation_project.activate_filter({ group:'day', selector:'.day_monday', english: 'Monday'}, true); break;
			case 4: immolation_project.activate_filter({ group:'', selector:'', english: ''}, -1); break;
		}

		if( num != 4 ) $("#preset_" + num).addClass("active_preset");

	},

	// activated after any filtration removes or adds persons
	after_filter: function() {
		immolation_project.center_to_markers();
	},

	get_active_filters: function() {
		var filter_array = [];
		$.each( this.filters, function(k,v) {
			filter_array.push( v.selector );
		});
		return( filter_array );
	},

	// should be called by clicking any of the indicators
	// (ex: months, genders, age ranges)
	activate_filter: function( filter_options, clear_all ) {

		$(".t_i_v").removeClass("selected_person");

		if( clear_all == -1 ) {
			$(".preset").removeClass("active_preset");

			$.each( immolation_project.filters, function( k, v ) {
				delete( immolation_project.filters[k] );
			});
		}

		// erase all filters and start over
		if( clear_all == true ) {
			$.each( immolation_project.filters, function( k, v ) {
				delete( immolation_project.filters[k] );
			});

		} else {

			// not a preset, so remove highlights
			$(".preset").removeClass("active_preset");
		}

		immolation_project.stop_marker_animation();

		if( clear_all != -1 ) {
			if( typeof this.filters[filter_options.group] == 'undefined' ) {
				this.filters[filter_options.group] = filter_options;//{ filter_options selector: filter_options.selector };
			} else {
				if( this.filters[filter_options.group].selector == filter_options.selector ) {
					delete( this.filters[filter_options.group] );
				} else {
					this.filters[filter_options.group] = filter_options;
				}
			}
		}

		// todo: provide language hints for filters?
		/*
		$("#immolation_project_subhead").html(
			"<p> > " + this.get_active_filters().join("") + "</p>"
		);
		*/

		$('#div_t_i').isotope({
			filter: this.get_active_filters().join("")
		}, function() {
			immolation_project.update_view();
		});

	},

	// updates counts based on visible fields
	// ex: (t_i_count t_i_count_type_age t_i_count_type_age_name_40-45) should contain a number
	//     t_i_count t_i_count_type_gender t_i_count_type_gender_name_m
	update_view: function() {
		this.get_breakdowns();

		//$.each( this.get_keys_as_array( this.filters ), function( count_index, count_field ) {
		//$.each( immolation_project.filters, function( count_field ) {

		$.each(["yearmonthformula", "gender", "agegroup", "dayofweekformula" ], function( count_index, count_field ) {

			$.each( immolation_project.field_counts[count_field], function( k, v ) {

				var indicator = immolation_project.control_indicators[count_field][k];

				var indicator_value = immolation_project.field_counts_visible[count_field][k];
				if( typeof indicator_value == 'undefined' ) indicator_value = 0;

				if( typeof indicator != 'undefined' ) {
					indicator.update( indicator_value );
				}

			});
		});

		immolation_project.after_filter();
	},

	calculate_range: function( d ) {

		var calculated_range = {
			min: 0,
			max: 0,
			sum: 0,
			count: 0
		};

		$.each( d, function( k, v ) {
			calculated_range.count++;
			calculated_range.sum += v;
            if( v > calculated_range.max ) calculated_range.max = v;
		});

		return( calculated_range );
    },

	get_keys_as_array: function( d ) {
		var this_is_an_array = [];
		$.each( d, function(k, v) {
			this_is_an_array.push( k );
		});
		return( this_is_an_array );
	},

	// g { paper, pp, label, data }
	generate_dyn_graph: function( g, iterator_functions ) {

		//g.paper.rect( g.pp.x, g.pp.y, g.pp.w, g.pp.h ).attr( { fill: 'silver' } );	// debug
		g.i_count = 0;

		// draw label
		g.paper.text( g.label.x, g.label.y, g.label.text ).attr( this.styles.labels ).attr( g.label.style );

		// range for further graphing
		g.range = this.calculate_range( g.data[g.key] );
		g.pp.pd2 = g.pp.pd * 2;

		// loop through keys, or array if specified to draw individual bars
		if( g.loop == null ) {
			var to_execute = this.get_keys_as_array( g.data[g.key] ).sort();
		} else {
			var to_execute = g.loop;
		}

		// draw bars
		for( i = 0; i < to_execute.length; i++ )(function(k,v) {

			// if( typeof immolation_project.translations[k.toLowerCase()] == "undefined" ) return;

			// pass values to iterator object, for hooks
			g.__k = k;
			g.__v = v;

			if( typeof iterator_functions != 'undefined' && typeof iterator_functions.before == 'function' ) {
				iterator_functions.before(g);
			}

			// bar size
			immolation_project.control_indicators[g.key][k] = {
				get_size: function( val ) {
					if( g.hor == true ) {	// histogram, days of week
						return( ((val+1) * (g.pp.h-g.pp.pd)) / (g.range.max + g.pp.pd) );
					} else {
						return( ((val+1) * (g.pp.w-g.pp.pd)) / (g.range.max + g.pp.pd) );
					}
				},
				// determines whether current item is an active filter
				is_filter: function() {

					if( typeof immolation_project.filters[g.group] != 'undefined' ) {
						if( immolation_project.filters[g.group].selector == g.prefix + k.toLowerCase() ) {
							return( true );
						}
					}

					return( false );
				},
				update: function( val ) {

					placeholder_text.attr( "text", val );

					if( val == 0 ) {
						bar.hide();
					} else {
						bar.show();
					}

					if( g.hor == true ) {	// histogram, days of week
						h = immolation_project.control_indicators[g.key][k].get_size( val );
						bar.stop().animate( { y: g.pp.y + g.pp.h - h - g.pp.pd, height: h }, immolation_project.animation_length, "<>" );
					} else {
						w = immolation_project.control_indicators[g.key][k].get_size( val );
						bar.stop().animate( { width: w }, immolation_project.animation_length, "<>" );
					}

					// highlight active filter, if this item is it. and is selected.
					if( immolation_project.control_indicators[g.key][k].is_filter() == true ) {
						bar.attr( immolation_project.styles.selected_bar );
						label.attr( immolation_project.styles.selected_bar_label );
					} else {
						bar.attr( immolation_project.styles.histogram_bar );
						label.attr( immolation_project.styles.histogram_bar_label );
					}
				}
			};

			// histogram, days of week
			if( g.hor == true ) {

				var h = immolation_project.control_indicators[g.key][k].get_size( v );

				var s = (g.pp.w - g.pp.pd2) / g.range.count;
				var x = g.pp.x + g.pp.pd + (s * g.i_count);
				var w = s - g.pp.pd;
				var y = g.pp.y + g.pp.h - h - g.pp.pd;

				var EX = x;
				var EY = g.pp.y + g.pp.pd;
				var EW = w;
				var EH = g.pp.h - g.pp.pd2;

				var text_x = x + (w/2);
				var text_y = g.pp.y + g.pp.h + g.pp.pd2;

				var label_x = text_x;//text_x + (w/2);
				var label_y = g.pp.y + g.pp.h - h - 15;
				if( label_y < 15 ) label_y = 15;

			} else {

				var w = immolation_project.control_indicators[g.key][k].get_size( v );

				var s = (g.pp.h - g.pp.pd2) / g.range.count;
				var x = g.pp.x + g.pp.pd;
				var y = g.pp.y + g.pp.pd + (s * g.i_count);
				var h = s - g.pp.pd;

				var EX = x;
				var EY = y;
				var EW = g.pp.w - g.pp.pd2;
				var EH = h;

				var text_x = x - g.pp.pd2;
				var text_y = y + (s/2)-2;

				var label_x = x + (w/2)-2;
				var label_y = text_y;

			}

			// allow for a blankety line
			if( v != null ) {

				// this is the bar that remains permanently affixed
				var shadow_bar = g.paper.rect(
					x, y, w, h
				).attr(
					immolation_project.styles.histogram_bar
				).attr(
					immolation_project.styles.shadow_bar
				);

				// this is the dynamic bar that resizes
				var bar = g.paper.rect(
				   x, y, w, h
				).attr(
					immolation_project.styles.histogram_bar
				);

				// label always visible
				var label = g.paper.text(
					text_x,
					text_y,
					immolation_project.translations[k.toLowerCase()]
				).attr(
					immolation_project.styles.labels
				).attr(
					g.labels.style
				);

				// mouseover visible text
				var placeholder_text = g.paper.text(
					label_x, label_y, v
				).attr(
					immolation_project.styles.labels
				).attr({ opacity: 0 });

				// mouseover element
				g.paper.rect(
					 EX, EY, EW, EH
				).attr({
					fill: 'green',
					opacity: 0,
					cursor: 'pointer'
				}).mouseover( function() {
					placeholder_text.stop().animate( { opacity: 1 }, immolation_project.animation_length, "<>" );
					bar.stop().animate( { opacity: 0.5 }, immolation_project.animation_length, "<>" );
				}).mouseout( function() {
					placeholder_text.stop().animate( { opacity: 0 }, 500, "<>" );
					bar.stop().animate( { opacity: 1 }, 500, "<>" );
				}).click( function() {
					immolation_project.activate_filter({
						group: g.group,
						selector: g.prefix + k.toLowerCase(),
						english: k
					});
				});

			} // end if v = null

			// pass values to iterator object, for hooks
			g.__x = x;
			g.__y = y;

			if( typeof iterator_functions != 'undefined' && typeof iterator_functions.after == 'function' ) {
				iterator_functions.after(g);
			}

			g.i_count++;
		})(to_execute[i], g.data[g.key][to_execute[i]]);



	},

	generate_graphs: function() {

		this.generate_dyn_graph({
			paper: 	immolation_project.canvas_left.paper,
			pp: 	{ x: 75, y: 30, w: 230, h: 60, pd: 4 },
			label: 	{ x: 300, y: 20, text: immolation_project.__("gender"), style: immolation_project.styles.labels_r },
			labels: { style: immolation_project.styles.labels_r },
			data: 	immolation_project.field_counts,
			key: 	"gender",
			loop:	["Male", "Female"],
			hor: 	false,
			group:	"gender",
			prefix:	".gender_"
		});

		this.generate_dyn_graph({
			paper: 	immolation_project.canvas_left.paper,
			pp: 	{ x: 75, y: 110, w: 230, h: 200, pd: 4 },
			label: 	{ x: 300, y: 100, text: immolation_project.__("agegroup"), style: immolation_project.styles.labels_r },
			labels: { style: immolation_project.styles.labels_r },
			data: 	immolation_project.field_counts,
			key: 	"agegroup",
			loop:	null,
			hor: 	false,
			group:	"age",
			prefix:	".age_"
		});

		this.generate_dyn_graph({
			paper: 	immolation_project.canvas_left.paper,
			pp: 	{ x: 75, y: 340, w: 230, h: 70, pd: 5 },
			label: 	{ x: 300, y: 330, text: immolation_project.__("dayofweek"), style: immolation_project.styles.labels_r },
			labels: { style: immolation_project.styles.labels },
			data: 	immolation_project.field_counts,
			key: 	"dayofweekformula",
			loop:	["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
			hor: 	true,
			group:	"day",
			prefix:	".day_"
		});

		var sticky = { count: 0, last_year: 0, current_year: 0 };

		// force 2010 to be skipped
		immolation_project.field_counts.yearmonthformula["2009-03"] = null;
		immolation_project.field_counts.yearmonthformula["2010-01"] = null;

		for( y = 2011; y <= 2012; y++ ) {
			for( m = 1; m <= 12; m++ ) {
				var tkey = y + "-" + (m < 10 ? '0' : '') + m;
				if( typeof immolation_project.field_counts.yearmonthformula[tkey] == 'undefined' ) {
					immolation_project.field_counts.yearmonthformula[tkey] = null;
				}
			}
		}

		this.generate_dyn_graph({
			paper: 	immolation_project.canvas_top.paper,
			pp: 	{ x: 0, y: 5, w: 640, h: 80, pd: 2 },
			label: 	{ x: 0, y: 0, text: immolation_project.__("yearmonthformula"), style: immolation_project.styles.labels_r },
			labels: { style: immolation_project.styles.labels },
			data: 	immolation_project.field_counts,
			key: 	"yearmonthformula",
			loop:	null,
			hor: 	true,
			group:	"year-month",
			prefix:	".year_month_"
		}, {
			after: function(p) {

				var t = p.__k.split("-");
				sticky.year = t[0];

				// year change
				if( sticky.year != sticky.last_year ) {

					sticky.count++;
					if( sticky.count == 1 ) return( false );

					p.paper.text(
						p.__x-2, 20, sticky.year
					).attr( immolation_project.styles.histogram_text ).attr( { transform: 'r-90' } );

					p.paper.path(
						"M" + (p.__x - 1) + ",40 l0,60"
					).attr( immolation_project.styles.histogram_year_line );
				}

				sticky.last_year = t[0];

			}
		});

	},

	// updates map markers based on isotope visibility
	continually_update_markers: function() {

		setInterval( function() {

			$.each( immolation_project.markers_lookup, function(div_id,marker_id) {
				var hidden = $("#" + div_id).hasClass("isotope-hidden");
				var marker = immolation_project.markers[marker_id];

				if( hidden == false ) {

					if( marker.getMap() == null ) {
						marker.setMap( immolation_project.map );
					}

				} else {

					if( marker.getMap() != null ) {
						marker.setMap( null );
					}
				}
			});

		}, immolation_project.marker_update_interval );

	},

	stop_marker_animation: function() {
		$.each( immolation_project.markers, function(k,v) {
			v.setAnimation( null );
		});
	},

	// execution chain -> doc ready -> .init -> tabletop.callback -> .slides_loaded
	slides_loaded: function() {

		// first load, so assume all persons are visible
		immolation_project.get_breakdowns();

		$(".t_i_v").click( function() {
			var id = $(this).attr("t_i_v_id");
			var div_id = $(this).attr("id");

			$(".t_i_v").removeClass("selected_person");

			immolation_project.stop_marker_animation();

			var marker_id = immolation_project.markers_lookup[div_id];
			if( typeof marker_id != 'undefined' ) {

				$(this).addClass("selected_person");

				$.smoothScroll({
					scrollTarget: "#immolation_map_histogram"
				});

				immolation_project.markers[marker_id].setAnimation(
					google.maps.Animation.BOUNCE
				);
			}

			immolation_project.after_filter();
		});

		$(".t_i_v_has_position_info").mouseover( function() {
			$(this).addClass("t_i_v_has_position_info_hover");
		}).mouseout( function() {
			$(this).removeClass("t_i_v_has_position_info_hover");
		});


		//markerCluster = new MarkerClusterer(immolation_project.map, immolation_project.markers, immolation_project.cluster_options );

		$("#div_t_i").isotope();

		this.update_view();
		this.generate_graphs();
		this.continually_update_markers();
	},

	slightly_random: function( num ) {
		var n = parseFloat( num );
		var range = 0.1;
		var half_range = range / 2;
		return( parseFloat( n + (Math.random() * range) - half_range ) );
	},

	pangea_resize: function( url, w ) {
		var t = url.split(".");
		t[t.length - 2] += "_w" + w;
		return( t.join(".") );
	},

	// visually adds a person, their data, and map marker
	add_person: function( i, e ) {

		var div_id = "person_" + i;

		// histogram data for graph
		//var key = e.yearformula + "-" + e.monthformula;

		/*
		var key = e.yearmonthformula.toLowerCase();
		if( key.length > 3 ) {
			if( typeof( this.histogram[key] ) == 'undefined' ) {
				this.histogram[key] = 1;
				this.range.count++;
			} else {
				this.histogram[key]++;
			}

			if( this.histogram[key] > this.range.max ) this.range.max = this.histogram[key];
		}
		*/

		immolation_project.data["p"+i] = e;

		var img = '';
		if( e.image != '' ) {
			// img = "<img sin='" + e.sinumber + "' width='150' src='" + e.image + "' />";
			//var resize_by_pangea_f = e.image.split(".");
			//var resize_by_pangea = resize_by_pangea_f[0] + "_w150" + resize_by_pangea_f[1];
			e.image = this.pangea_resize( e.image, "150" );
			img = "<img width='" + e.w + "' height='" + e.h + "' src='" + e.image + "' />";
			//img = "<img width='" + e.w + "' height='" + e.h + "' src='" + resize_by_pangea + "' />";

		} else {
			// img = "<img sin='" + e.sinumber + "' width='150' src='http://gdb.voanews.com/C269090C-58EF-4270-8C8A-299D4E447036.png' />";
			img = "<img width='150 height='149' src='http://gdb.voanews.com/C269090C-58EF-4270-8C8A-299D4E447036.png' />";
		}

		if( e.latitude != '' && e.longitude != '' ) {

			var marker = new google.maps.Marker( {
				position: new google.maps.LatLng(
					// this.slightly_random( e.latitude ), this.slightly_random( e.longitude )
					e.latitude, e.longitude
				),
				map: immolation_project.map,
				icon: (
					e.gender == 'Female' ?
					"http://tools.voanews.com/img/female-2.png" :
					"http://tools.voanews.com/img/male-2.png"
				),
				//title: "SI # = " + e.sinumber + " (" + e.name + ")"
				title: e.name
			});

			google.maps.event.addListener(marker, 'click', function() {
				//$("div[sinumber=" + e.sinumber + "]").scrollIntoView();

				$(".t_i_v").removeClass("selected_person");

				var active_tile = "#" + div_id;

				// $("#" + div_id).css( { opacity: 0 } );

				//$("#" + div_id)[0].scrollIntoView();						// worked
				//$("#" + div_id).smoothScroll();

				//$(active_tile).fadeOut("fast");

				$.smoothScroll({
					scrollTarget: "#" + div_id,
					afterScroll: function() {
						// $("#" + div_id).addClass("selected_person");
						//$(active_tile).fadeIn("slow");

						//$(active_tile).fadeIn("slow", function() {
							$(active_tile).addClass("selected_person");

						//});

					}
				});

				$.each( immolation_project.markers, function(k,v) {
					v.setAnimation( null );
				});

				//var marker_id = immolation_project.markers_lookup[div_id];
				//immolation_project.markers[marker_id].setAnimation(
				//	google.maps.Animation.BOUNCE
				//);

				this.setAnimation( google.maps.Animation.BOUNCE );

				immolation_project.after_filter();

			});

			immolation_project.markers_lookup[div_id] = immolation_project.markers.length;
			immolation_project.markers.push( marker );
		}

		// programmatically insert isotope-filterable items
		var classes = ["t_i_v" /*, "gender", "year", "day", "age", "day", "year_month" */ ];
		classes.push( "t_i_v_id_p" + i );
		classes.push( "gender_" + e.gender.toLowerCase() );
		classes.push( "age_" + e.agegroup.toLowerCase().replace(" ", "_") );
		classes.push( "day_" + e.dayofweekformula.toLowerCase() );
		classes.push( "year_month_" + e.yearmonthformula.toLowerCase() );

		// classes.push( "year_month_" + e.yearformula.toLowerCase() + "-" + e.monthformula.toLowerCase() );

		if( e.latitude != '' && e.longitude != '' ) classes.push( "t_i_v_has_position_info" );

		//sinumber ?
		$("#div_t_i").append(
			"<div id='" + div_id +  "' t_i_v_id='" + i + "' class='" + classes.join(" ") + "'>" +
				"<div class='t_i_n'>" + e.name + "<br/>{$options->label_age}" + e.age + "</div>" +
				img +
				"<div class='edata'>" +
					"<div class='ecurr'>{$options->label_immolation_date}" + e.cleandate + "<br/>" + e.currentstatus + "</div>" +
					"<div class='eloca'>{$options->label_location}" + e.locationofincident + "</div>" +
					"<div class='ebio'>" + e.bio + "</div>" +
				"</div>" +
			"</div>"
		);

	},

	// loops through entire dataset
	get_breakdowns: function( breakdown_options ) {

		// reset data structure, recompute
		immolation_project.field_counts = { };
		immolation_project.field_counts_visible = { };

		$.each( immolation_project.data, function( i, e ) {
			immolation_project.breakdown( i, e );
		});
	},

	// perform count of available data
	// loop through persons (index = ..._p0, ..._p1  etc)
	breakdown: function( index, row ) { //row, only_if_visible ) {

		var is_hidden = $(".t_i_v_id_" + index).hasClass("isotope-hidden");

		// k, v here are "gender" > "f", etc.
		$.each( row, function( k, v ) {

			// all
			if( typeof immolation_project.field_counts[k] == 'undefined' ) immolation_project.field_counts[k] = { };
			if( typeof immolation_project.field_counts[k][v] == 'undefined' ) immolation_project.field_counts[k][v] = 0;

			immolation_project.field_counts[k][v]++;

			// visible only
			if( is_hidden == false ) {

				if( typeof immolation_project.field_counts_visible[k] == 'undefined' ) immolation_project.field_counts_visible[k] = { };
				if( typeof immolation_project.field_counts_visible[k][v] == 'undefined' ) immolation_project.field_counts_visible[k][v] = 0;

				immolation_project.field_counts_visible[k][v]++;

			}
		});
	},

	center_to_markers: function() {

		var ccccc = 0;
		var ddddd = 0;

		var bounds = new google.maps.LatLngBounds();
		for( i = 0; i < immolation_project.markers.length; i++ ) {

			if( immolation_project.markers[i].getMap() != null ) {
				bounds.extend( immolation_project.markers[i].position );
				ccccc++;
			}
			ddddd++;
		}

		if( ccccc == 0 ) {
			immolation_project.map.setCenter( immolation_project.map_options.center );
		} else {
			immolation_project.map.fitBounds( bounds );
		}

	},

	// execution chain -> doc ready -> .init -> tabletop.callback -> .slides_loaded
	// makes sense to hold off on loading anything until data arrives
	init: function() {

		// raphael canvas
		/*
		*/
		immolation_project.canvas_left.paper = Raphael(
			"control",
			immolation_project.canvas_left.width,
			immolation_project.canvas_left.height
		);

		immolation_project.canvas_top.paper = Raphael(
			"immolation_map_histogram",
			immolation_project.canvas_top.width,
			immolation_project.canvas_top.height
		);

		// create map
		immolation_project.map = new google.maps.Map(
			document.getElementById('immolation_map_canvas'),
			immolation_project.map_options
		);

		Tabletop.init( {
{if $options->cache_url}
			proxy: "{$options->cache_url}",
{/if}
			key: immolation_project.key,
			callback: function(data) {
				$.each( data, function(i, e ) {
					immolation_project.add_person( i, e );
				});
				immolation_project.slides_loaded();
			},
			simpleSheet: true
		});
	}
};




$(document).ready( function() {
	jQuery("#{$div_id}").html(
		{$css|json_encode} +
		"<div style='clear:both'></div>" +
		{$html|json_encode} +
		"<div style='clear:both'></div>"
	);

	immolation_project.init();

});

// hrmmmmmmmmmm. pangea routine can interfere with interactives, so overriding.
function changeFontSize() {

}

{*</script>*}
