<?php

use Illuminate\Support\Facades\DB;

function getNot(){
    return DB::table('v_limitfornotication')->select('*')->get();
}
function countNot(){
    return DB::table('v_limitfornotication')->count();
}


?>