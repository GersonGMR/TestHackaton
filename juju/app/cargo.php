<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class cargo extends Model
{
    public $timestamps = false;
    public function almacenarCargo(){
        $report = new cargo;
        $report->cargo = "Descartable";
        $report->timestamps();
        $report->save();
    }
}
