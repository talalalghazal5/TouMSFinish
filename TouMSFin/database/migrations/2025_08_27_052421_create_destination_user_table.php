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
        Schema::create('destination_user', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->foreignId('destination_id')->constrained('destinations')->cascadeOnDelete();

            $table->enum('want_guide', ['Yes', 'No'])->default('No');  // المستخدم يريد مرشد أم لا
            $table->date('requested_date')->nullable();                // تاريخ الرحلة
            $table->enum('status', ['pending', 'sent_to_guide', 'confirmed_by_guide', 'accepted_by_admin', 'rejected'])
                ->default('pending');                                // حالة الطلب
            $table->foreignId('guide_id')->nullable()->constrained('users')->cascadeOnDelete(); // المرشد المعيّن

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('destination_user');
    }
};
