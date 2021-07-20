<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class UserLoginController extends Controller
{
    // Trả về trang login
    function create() {
        return view("login");
    }

    //Xử lý khi người dùng đăng nhập
    function userLogin(Request $request)
    {
        $arr = $request->validate(
            [
                'email' => 'required',
                'password' => 'required|max:30',
            ]
        );
        $remember = $request->has("saveUser") ? true : false;

        if (Auth::attempt($arr, $remember)) {
            return redirect("profile");
        }
    }

      //Xử lý logout
      function userLogout()
      {
          if (Auth::check()) {
              Auth::logout();
              return redirect("login");
          }
      }
}
