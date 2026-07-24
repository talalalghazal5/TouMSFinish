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
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
        //     $table->foreignId('booking_id')->constrained('bookings')->cascadeOnDelete();
        //     $table->integer('amount');
        //    $table->enum('paymentMethod',['creditCard','payPale']);
        //    $table->date('PaymentDate')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->foreignId('user_id')->constrained('users');
            $table->integer('total_price_fligth');
            $table->integer('total_price_hotel');
            $table->integer('total_price');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
