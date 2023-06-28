<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', function () {
    return view('welcome');
})->name('home');

Route::middleware(['auth'])->get('/', function () {
    $super = Auth::user()->hasRole('super');
    $admin = Auth::user()->hasRole('admin');
    $manager = Auth::user()->hasRole('manager');  
    $user = Auth::user()->hasRole('user');

    if($admin || $super) {
        return redirect('/admin/users');
    }elseif($manager) {
        return redirect('/admin/clients');
    }elseif($user) {
        return redirect('/admin/clients');
    }else{
        return view('/welcome');
    }
})->name('dashboard');

Route::group(['prefix' => 'admin', 'middleware' => 'auth:sanctum'], function(){
    Route::resource('users', 'App\Http\Controllers\Admin\UserController');
    Route::resource('roles', 'App\Http\Controllers\Admin\RoleController');
    Route::resource('permissions', 'App\Http\Controllers\Admin\PermissionController');
    Route::resource('clients', 'App\Http\Controllers\Admin\ClientController');
});

Auth::routes();

// Esta pode ser acessada até sem login, é pública
Route::resource('clients', 'App\Http\Controllers\ClientController');
