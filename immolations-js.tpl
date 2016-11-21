<script type="text/javascript">

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

			// temporary data fix until gdocs formulas get replaced in logic
			if(
				g.key == "agegroup" &&
				typeof immolation_project.translations[k.toLowerCase()] == "undefined"
			) {
				return;
			}

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
			pp: 	{ x: 75, y: 30, w: 230, h: 80, pd: 4 },
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
			pp: 	{ x: 75, y: 110, w: 230, h: 240, pd: 4 },
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

		immolation_project.canvas_top.paper = new ScaleRaphael(
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

function resize_window_handler() {
    var w = $(this);
    var new_w = w.width() - 322 - 10;
    if( new_w > 1300 ) new_w = 1300;

    immolation_project.canvas_top.paper.changeSize(new_w, w.height(), false, true);
}


$(document).ready( function() {
	immolation_project.init();

    $(window).resize(function() {
        resize_window_handler();
    });

    resize_window_handler();
});

</script>
