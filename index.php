<?php
require("vendor/autoload.php");
require("data.php");

# templating is decent here
$smarty = new Smarty();

# snapshot of data from timeline-editor
$data = json_decode(file_get_contents("data/data-en.json"), true);
$data["options"] = (object)$data["options"];

# spreadsheet, multi-sheet
$lang = "English"; // control later via .htaccess?
$sheet = json_decode(file_get_contents("data/spreadsheet.json"), true);
$sheet = data_cleanup($sheet[$lang]);

#### debug
header("Content-Type: text/html; charset=utf-8");
echo "<PRE>";print_r( $sheet ); die;

# load into smarty
foreach( $data as $k => $v ) {
    if( $k === "slides" ) $v = array_values($v);
    $smarty->assign($k, $v);
}

$smarty->display( "immolations_i.tpl" );
