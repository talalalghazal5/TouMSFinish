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
        Schema::create('flights', function (Blueprint $table) {
            $table->id();

            $table->integer('flightNumber');
            $table->string('From');
            $table->string('To');
            $table->date('departureDate');

            $table->string('departureTime');

            $table->integer('numOfSeats');
            $table->string('arrivalTime');
            $table->string('flightPrice');
            $table->string('departureAirport');
            $table->string('LandingAirport');
            $table->enum('status', ['pending', 'confirmed', 'rejected'])->default('pending');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('flights');
    }
};
