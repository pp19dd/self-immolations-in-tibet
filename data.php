<?php

function field_cleanup($field_name) {
    return( str_replace(" ", "_", strtolower(trim($field_name)) ) );
}

function row_cleanup($row) {
    $h = array();

    foreach( $row as $k => $v ) {
        $h[field_cleanup($k)] = trim($v);
    }

    return( $h );
}

function data_get_classes($row) {
    $classes = array();

    $classes[] = "gender_" . strtolower($row["gender"]);

    $ts = strtotime($row["date_of_immolation"]);
    $classes[] = "day_" . strtolower(date("l", $ts));
    $classes[] = "year_month_" . date("Y-m", $ts);

    // age binning pattern ex: 35-39
    $a = intval($row["age"]);
    if( $a === 0 ) {
        $classes[] = "agegroup_unknown";
    } else {
        $pa = intval($a/5) * 5;
        $classes[] = "agegroup_" . $pa . "-" . ($pa+4);
    }

    $l1 = floatval($row["latitude"]);
    $l2 = floatval($row["longitude"]);

    if( $l1 !== 0 && $l2 !== 0 ) {
        $classes[] = "t_i_v_has_position_info";
    }

    return( implode(" ", $classes ) );
}
// classes.push( "age_" + e.agegroup.toLowerCase().replace(" ", "_") );

function data_cleanup($rows) {
    $ret = array();

    foreach( $rows as $row ) {
        $temp = row_cleanup($row);
        $temp['classes'] = data_get_classes($temp);
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
