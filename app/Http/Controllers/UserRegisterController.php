<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class UserRegisterController extends Controller
{
    // Trả về trang register
    function create()
    {
        return view("register");
    }

    //Xử lý người dùng đăng ký
    function userRegister(Request $request)
    {
      $request->validate(
          [
            'name' => 'required|min:2',
            'email' => 'required|min:2',
            'password' => 'required|min:8|max:30',
            'confirm-password' => 'required|min:8|max:30|same:password',
          ]
          );

        try {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);
        } catch (\Throwable $th) {
            return "Người dùng đã tồn tại";
        }

        Auth::login($user);

        return redirect(RouteServiceProvider::HOME);
    }
}
