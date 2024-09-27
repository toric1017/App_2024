package com.eai_work.common.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.eai_work.common.vo.ResponseVO;

@SuppressWarnings("rawtypes")
public class ResponseUtil {

	public static ResponseEntity<ResponseVO> responseSuccessEntity(){
		ResponseVO<Object> vo = new ResponseVO<Object>("S", "Success");
		return ResponseEntity.ok().body(vo);
	}
	
	public static ResponseEntity<ResponseVO> responseSuccessEntity(String meg){
		ResponseVO<Object> vo = new ResponseVO<Object>("S", meg);
		return ResponseEntity.ok().body(vo);
	}
	
	public static ResponseEntity<ResponseVO> responseSuccessEntity(Object obj){
		ResponseVO<Object> vo = new ResponseVO<Object>(obj, "S", "Success");
		return ResponseEntity.ok().body(vo);
	}
	
	public static ResponseEntity<ResponseVO> responseErrorEntity(){
		ResponseVO<Object> vo = new ResponseVO<Object>("E", "Server Error");
		return ResponseEntity.badRequest().body(vo);
	}
	
	public static ResponseEntity<ResponseVO> responseErrorEntity(String meg){
		ResponseVO<Object> vo = new ResponseVO<Object>("E", meg);
		return ResponseEntity.badRequest().body(vo);
	}
	
	public static ResponseEntity<ResponseVO> responseErrorEntity(Object obj){
		ResponseVO<Object> vo = new ResponseVO<Object>(obj, "E", "Server Error");
		return ResponseEntity.badRequest().body(vo);
	}
	
	public static ResponseEntity<ResponseVO> responseUnAuthEntity(){
		ResponseVO<Object> vo = new ResponseVO<Object>("E", "Unauthorized");
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(vo);
	}
}
