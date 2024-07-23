<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
{
    $rules = [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8', 
    ];
    
    $validator = Validator::make($request->all(), $rules);

    if ($validator->fails()) {
        if ($validator->errors()->has('email')) {
            return response()->json(['errors' => ['email' => ['该邮箱已被使用']]], 422);
        }
        return response()->json(['errors' => $validator->errors()], 422);
    }

    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
    ]);

    return response()->json(['message' => '注册成功'], 201);
}
}