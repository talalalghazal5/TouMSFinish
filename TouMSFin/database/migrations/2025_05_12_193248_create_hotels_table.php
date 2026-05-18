<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('hotels', function (Blueprint $table) {
            $table->id();


            $table->string('hotelName');
            $table->string('cityName');
            $table->enum('hotelStatus', ['threetars', 'fourstars', 'fivestars']);
            $table->enum('roomStatus', ['normal', 'high', 'superperfect']);
            $table->string('hotelDayPrice');
            $table->enum('status', ['pending', 'confirmed', 'rejected'])->default('pending');
            $table->string('image1');
            $table->string('image2');
            $table->string('image3');
            $table->string('image4');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hotels');
    }
};
