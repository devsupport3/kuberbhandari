package com.ui.controller;

public class ApiResponse<T> {
	    private String message;
	    private T data;
		private boolean success;

	    public ApiResponse(boolean success, String message, T data) {
	        this.success = success;
	        this.message = message;
	        this.data = data;
	    }

	    // Optional helper methods
	    public static <T> ApiResponse<T> success(String message, T data) {
	        return new ApiResponse<>(true, message, data);
	    }

	    public static <T> ApiResponse<T> failure(String message) {
	        return new ApiResponse<>(false, message, null);
	    }

	    // Getters and setters
	    public boolean isSuccess() { return success; }
	    public void setSuccess(boolean success) { this.success = success; }

	    public String getMessage() { return message; }
	    public void setMessage(String message) { this.message = message; }

	    public T getData() { return data; }
	    public void setData(T data) { this.data = data; }
}
