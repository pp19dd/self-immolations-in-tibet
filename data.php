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
