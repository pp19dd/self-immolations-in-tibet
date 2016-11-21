<style type="text/css">

html, body {
    margin:0;
    padding:0;
    width:100%;
    height:100%;
    background-color: black;
    color: #DDDDDD;
}

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
    max-width:1300px;
    margin: auto;
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
    padding:0.5em;
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

h2, h3 {
    line-height: 1.2em;
    padding:0;
    margin:0;
}

#immolation_project_title h2, #immolation_project_title h2 a, #immolation_project_title h3, #immolation_project_title h3 a {
    font-family: 'Oswald', sans-serif;
    font-size: 2em;
    font-weight: normal !important;
    padding-top: 0;
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

@media (min-width:370px) { #immolation_project_title h2, #immolation_project_title h3 { font-size:1.5em; } }
@media (min-width:500px) { #immolation_project_title h2, #immolation_project_title h3 { font-size:2em; } }
@media (min-width:630px) { #immolation_project_title h2, #immolation_project_title h3 { font-size:2.5em; } }
@media (min-width:1200px) { #immolation_project_title h2, #immolation_project_title h3 { font-size:3em; } }

#immolation_project_title a {
    text-decoration:none;
}

#immolation_project_title a:hover {
	opacity:0.5;
}

#immolation_project_video {
	/* height:400px; */
}

#immolation_project_video a { display: none }
#immolation_project_video object {
	margin-left:0px !important;
}

#immolation_project_subhead p {
    font-family: 'Open Sans', sans-serif;
    background-color: rgba(0,0,0,0.5);
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
	/*width:647px;*/
    margin-bottom:0.75em;
    width:100%;
	background-color: #505050;
    padding-bottom:0.5em;
}

.tables_can_help {
	background-color: black;
	border-top:10px solid black;
	border-bottom:10px solid black;
}

#immolation_map_histogram_note {
    margin-top: 1em;
}

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

.presets { width: 100%; display:flex }
.preset {
    width: 25%;
    padding-right:0.5em;
    border-right: 1px dotted gray;
}

.preset:nth-child(4) {
    border-right: 0; padding-right: 0
}

.preset { }
.preset a { text-decoration: underline }
.preset a:hover { color: white !important }
.preset a { }

/* todo: fix this? */
/*
@media (max-width:860px) {
    .immolation_project_section_1 {
        background-position: 99% 0%;
    }
}
*/

@media (max-width:600px) {
    .presets { flex-wrap: wrap }
    .preset { width: 47% }
    .preset:nth-child(2) { border-right:0; padding-right: 0 }
    .preset:nth-child(1), .preset:nth-child(2) { border-bottom: 1px dotted gray; }
}

.active_preset p {
	background-color: #60675A !important;
	color: black;
}
.active_preset a {
	/*color: black !important;*/
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
