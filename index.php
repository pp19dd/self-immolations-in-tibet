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

$smarty->display( "immolations_i.tpl" );
