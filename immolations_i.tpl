<!doctype html>
<html>
<head>
<title>{$text.title_1}{$text.title_2}</title>
<meta charset="utf-8" />
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
<link href="assets/style.css" rel="stylesheet" />

<script src="assets/jquery.min.js"></script>
<script src="assets/tabletop-2013-06-02.js"></script>
<script src="assets/jquery.isotope.min.js"></script>
<script src="assets/jquery.smooth-scroll.min.js"></script>
<script src="assets/raphael-min.js"></script>
<script src="assets/scale.raphael.js"></script>
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
				<img class="voa-logo" src="assets/voa2.png" />
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
				<div id="div_t_i">
{foreach from=$sheet item=entry}
					<div id="person_{$entry@index}" class="t_i_v t_i_v_id_p{$entry@index}">
						<div class="t_i_n">
							<div class="t_i_n_name">{$entry.name}</div>
							{if $entry.age}<div class="t_i_n_age">Age: {$entry.age}</div>{/if}
							{if $entry.affiliation}<div class="t_i_n_affiliation">Affiliation: {$entry.affiliation}</div>{/if}
							{if $entry.url_link}<div class="t_i_n_link"><a href="{$entry.url_link|trim}">Read Story</a></div>{/if}
						</div>
						<img width="150" height="180" src="{$entry.image|replace:'.jpg':'_w150_h180.jpg'|default:'https://gdb.voanews.com/C269090C-58EF-4270-8C8A-299D4E447036_w150_h180.png'}" />
						<div class="edata">
							<div class="ecurr">
								Protest date: {$entry.date_of_immolation}<br/>
								{$entry.current_status}
							</div>
							<div class="eloca">Location: {$entry.location_of_incident}</div>
							<div class="ebio">{$entry.bio}</div>
						</div>
					</div>

{/foreach}
				</div>
			</div>

		</div>

<script>
$("#div_t_i").isotope();
</script>


	</div>

	<div class="immolation_project_section immolation_project_section_3">

	</div>

</div>

{include file="immolations-js.tpl"}
</body>
</html>
