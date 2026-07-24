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
        Schema::create('user_hotels', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('hotel_id')->constrained('hotels')->cascadeOnDelete();
            $table->enum('bookingStatus', ['economy', 'VIP', 'super']);
            $table->date('bookingDate')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->integer('numberOfRooms');
             $table->integer('numberOfDays');
            $table->integer('total_price_hotel');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_hotels');
    }
};
