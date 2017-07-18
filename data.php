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

function data_cleanup($rows) {
    $ret = array();

    foreach( $rows as $row ) {
        $ret[] = row_cleanup($row);
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
