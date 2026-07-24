<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->enum('bookingStatus', ['economy', 'VIP', 'super']);
            $table->enum('bookingFor', ['Flight', 'Hotel', 'CarHire']);

            $table->date('bookingDate')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->integer('numbers');
            // $table->string('totalPrice');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
