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
$sheet_raw = json_decode(file_get_contents("data/spreadsheet.json"), true);
$sheet = data_cleanup($sheet_raw[$lang]);
$text_all = text_cleanup($sheet_raw["Page Text"]);

$smarty->assign( "text", $text_all[$lang] );
$smarty->assign( "sheet", $sheet );

#### debug
#### header("Content-Type: text/html; charset=utf-8");
#### echo "<PRE>";print_r( $sheet_raw["Page Text"] ); die;
#### echo "<PRE>";print_r( $text_all ); die;
#### echo "<PRE>";print_r( $sheet ); die;

# load into smarty
foreach( $data as $k => $v ) {
    if( $k === "slides" ) $v = array_values($v);
    $smarty->assign($k, $v);
}

$smarty->display( "immolations_i.tpl" );
