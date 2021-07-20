<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserLoginController;
use App\Http\Controllers\UserRegisterController;
use App\Providers\RouteServiceProvider;

Route::get("login", [UserLoginController::class, 'create'])
->middleware('CheckingLogout')
->name("login");

Route::get("register", [UserRegisterController::class, 'create'])
->middleware('CheckingLogout')
->name("register");

Route::post("/register", [UserRegisterController::class, 'userRegister']);

Route::post("/login", [UserLoginController::class, 'userLogin']);

Route::view("profile", RouteServiceProvider::HOME)
->middleware('CheckingLogin')
->name("profile");

Route::post("/logout", [UserLoginController::class, 'userLogout'])
->name('logout');