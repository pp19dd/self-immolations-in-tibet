<!doctype html>
<html>
<head>
<title>{$slides[0][1]}</title>
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
			{$slides[3][6]}
		</div>
		<div id="immolation_project_top_left">
			<div id="immolation_project_title">
				<img class="voa-logo" src="img/voa2.png" />
				<a href="{$slides[7][6]|trim|strip_tags}">
					<h2>{$slides[0][1]}</h2>
					<h3>{$slides[1][1]}</h3>
				</a>
			</div>
			<div id="immolation_project_subhead">
				<p>{$slides[2][6]}</p>

				<div class="presets">
					<div class="preset" id="preset_1"><a href="javascript:immolation_project.preset(1)"><p>{$slides[8][6]|strip_tags}</a></p></div>
					<div class="preset" id="preset_2"><a href="javascript:immolation_project.preset(2)"><p>{$slides[9][6]|strip_tags}</a></p></div>
					<div class="preset" id="preset_3"><a href="javascript:immolation_project.preset(3)"><p>{$slides[10][6]|strip_tags}</a></p></div>
					<div class="preset" id="preset_4"><a href="javascript:immolation_project.preset(4)"><p>{$slides[11][6]|strip_tags}</a></p></div>
				</div>

			</div>
		</div>
	</div>

	<div class="immolation_project_section immolation_project_section_2">

		<div class="immolation_project_container">

			<div class="project_note" id="immolation_map_histogram_note">
				<div class="project_note_inner" id="immolation_map_histogram_note_text">
					{$slides[5][6]|strip_tags}
				</div>
			</div>
			<div id="immolation_map_histogram"></div>
			<div id="control"></div>
			<div id="immolation_map_canvas"></div>
			<div class="immolation_disclaimer project_note">
				<div class="project_note_inner" id="immolation_disclaimer_text">
					{$slides[4][6]|strip_tags}
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
