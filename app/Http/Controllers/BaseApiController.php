<?php

namespace App\Http\Controllers;
use Illuminate\Http\Response;

abstract class BaseApiController extends Controller
{
    /**
     * 成功時のレスポンスを返却する
     *
     * @param array $params
     * @return JsonResponse
     */
    protected function successResponse($params = [])
    {
        return response()->json(
            [
                'response' => 1,
                'data' => $params,
            ],
            Response::HTTP_OK
        );
    }

    /**
     * エラー時のレスポンスを返却する
     *
     * @param string $message エラーメッセージ
     * @param int $status_code
     * @return JsonResponse
     */
    protected function errorResponse($message, $status_code = Response::HTTP_BAD_REQUEST)
    {
        return response()->json(
            [
                'response' => 0,
                'error_text' => $message
            ],
            $status_code
        );
    }
}