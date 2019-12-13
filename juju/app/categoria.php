<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class categoria extends Model
{
    public $timestamps = false;
    public function almacenarCategoria(){
        $report = new categoria;
        $report->categoria = "Descartable";
        $report->timestamps();
        $report->save();
    }
}
