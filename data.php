<?php

function field_cleanup($field_name) {
    return( str_replace(" ", "_", strtolower(trim($field_name)) ) );
}

function row_cleanup($row) {
    $h = array();

    foreach( $row as $k => $v ) {
        $key = field_cleanup($k);
        $h[$key] = trim($v);
        $h[$key] = str_replace("http://", "https://", $h[$key]);
    }

    return( $h );
}

function data_get_classes($row) {
    $classes = array();

    // "gender_" .
    $classes["g"] = strtolower($row["gender"]);

    $ts = strtotime($row["date_of_immolation"]);

    // "day_" .
    $classes["d"] = strtolower(date("l", $ts));

    // "year_month_" .
    $classes["ym"] = date("Y-m", $ts);

    // age binning pattern ex: 35-39
    $a = intval($row["age"]);
    if( $a === 0 ) {

        // agegroup_
        $classes["ag"] = "unknown";
    } else {
        $pa = intval($a/5) * 5;

        // agegroup_
        $classes["ag"] = $pa . "-" . ($pa+4);
    }

    $l1 = floatval($row["latitude"]);
    $l2 = floatval($row["longitude"]);

    if( $l1 !== 0 && $l2 !== 0 ) {
        $classes["p"] = "t_i_v_has_position_info";
    }

    return( $classes );
}
// classes.push( "age_" + e.agegroup.toLowerCase().replace(" ", "_") );

// prefixes above row data with CSS classes
function meta_to_classes($meta) {
    $classes = array();

    if( isset($meta["g"]) ) $classes[] = "gender_" . $meta["g"];
    if( isset($meta["d"]) ) $classes[] = "day_" . $meta["d"];
    if( isset($meta["ym"]) ) $classes[] = "year_month_" . $meta["ym"];
    if( isset($meta["ag"]) ) $classes[] = "agegroup_" . $meta["ag"];
    if( isset($meta["p"]) ) $classes[] = $meta["p"];

    return( implode(" ", $classes ));
}

function data_cleanup($rows) {
    $ret = array();

    foreach( $rows as $row ) {
        $temp = row_cleanup($row);
        $temp['data'] = data_get_classes($temp);
        $temp['classes'] = meta_to_classes($temp['data']);#implode(" ", $temp['data'] );
        $ret[] = $temp;
    }

    return( $ret );
}

function text_cleanup($rows) {
    $ret = array();

    foreach( $rows as $row ) {
        $symbol = array_shift($row);
        unset( $row["old location"] );

        foreach( $row as $lang => $translation ) {
            if( !isset($ret[$lang]) ) $ret[$lang] = array();
            $ret[$lang][$symbol] = trim($translation);
        }
    }
    return( $ret );
}
