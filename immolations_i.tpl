<!doctype html>
<html>
<head>
<title>{$text.title_1}{$text.title_2}</title>
<meta charset="utf-8" />
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
{include file="css.tpl"}

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/tabletop-2013-06-02.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/jquery.isotope.min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/jquery.smooth-scroll.min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/raphael-min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/scale.raphael.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhjY_0Dyf6t_EL803Ve_o_D7sd1O5oKCE"></script>

</head>

<body>

<div id="immolation_project">
	<div class="immolation_project_section immolation_project_section_1">
		<div id="immolation_project_top_right">
			{$text.widget_right}
		</div>
		<div id="immolation_project_top_left">
			<div id="immolation_project_title">
				<img class="voa-logo" src="img/voa2.png" />
				<a href="{$slides[7][6]|trim|strip_tags}">
					<h2>{$text.title_1}</h2>
					<h3>{$text.title_2}</h3>
				</a>
			</div>
			<div id="immolation_project_subhead">
				<p>{$text.intro}</p>

				<div class="presets">
					<div class="preset" id="preset_1"><a href="javascript:immolation_project.preset(1)"><p>{$text.preset_1}</a></p></div>
					<div class="preset" id="preset_2"><a href="javascript:immolation_project.preset(2)"><p>{$text.preset_2}</a></p></div>
					<div class="preset" id="preset_3"><a href="javascript:immolation_project.preset(3)"><p>{$text.preset_3}</a></p></div>
					<div class="preset" id="preset_4"><a href="javascript:immolation_project.preset(4)"><p>{$text.preset_4}</a></p></div>
				</div>

			</div>
		</div>
	</div>

	<div class="immolation_project_section immolation_project_section_2">

		<div class="immolation_project_container">

			<div class="project_note" id="immolation_map_histogram_note">
				<div class="project_note_inner" id="immolation_map_histogram_note_text">
					{$text.note_graph}
				</div>
			</div>
			<div id="immolation_map_histogram"></div>
			<div id="control"></div>
			<div id="immolation_map_canvas"></div>
			<div class="immolation_disclaimer project_note">
				<div class="project_note_inner" id="immolation_disclaimer_text">
					{$text.note_map}
				</div>
			</div>

			<div style="clear:both"></div>

			<div id="div_t_i_container">
				<div id="div_t_i"></div>
			</div>

		</div>




	</div>

	<div class="immolation_project_section immolation_project_section_3">

	</div>

</div>

{include file="immolations-js.tpl"}
</body>
</html>
