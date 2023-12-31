<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (config('app.env') === 'production') {
            URL::forceScheme('https');
        }

        Blade::directive('rupiah', function ($expression) {
            return "Rp <?php echo number_format($expression, 0, ',', '.'); ?>";
        });
        // View::Share('notifikasiLimit', function () {
        //     return DB::table('v_limitfornotikasi')->select('*')->get();
        // });
    }
}
