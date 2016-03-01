<?php
require("vendor/autoload.php");

# templating is decent here
$smarty = new Smarty();

# snapshot of data from timeline-editor
$data = json_decode(file_get_contents("data-en.json"), true);
$data["options"] = (object)$data["options"];

# load into smarty
foreach( $data as $k => $v ) {
    if( $k === "slides" ) $v = array_values($v);
    $smarty->assign($k, $v);
}

# rendering is specialized: large mix of js
?>
<meta charset="utf-8" />
<div id="<?php echo $data["div_id"] ?>" class="immolations_container">Loading...</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/tabletop-2013-06-02.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/jquery.isotope.min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/jquery.smooth-scroll.min.js"></script>
<script type="text/javascript" src="http://www.voanews.com/MediaAssets2/projects/fidget/raphael-min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script type="text/javascript">
<?php echo $smarty->fetch("immolations_i.tpl"); ?>
</script>
