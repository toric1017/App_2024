package com.eai_work.common.util;

import java.security.MessageDigest;

public class CredentialUtil {

	private final static String META_CREDENTIAL_SALT = "META_CREDENTIAL_SALT";
	private final static String META_CREDENTIAL_API_SALT = "META_CREDENTIAL_API_SALT";
	
	public static void main(String[] args){
		
		String pw = "12341234";
		
		System.out.println( encryptSHA256(pw) );
		
		System.out.println( isEqualSHA256(pw, META_CREDENTIAL_SALT, encryptSHA256(pw)) );
		
		String metaCredentialAPIkey = "META_CREDENTIAL_API_KEY_20240430_MADE_BY_YJS301";
		System.out.println( encryptSHA256(metaCredentialAPIkey) );
	}
	
	public static String encryptSHA256(String plainText) {
		String resStr = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update( (plainText + META_CREDENTIAL_SALT).getBytes() );
			byte[] encryptByte = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(byte b : encryptByte) {
				sb.append( String.format("%02x", b) );
			}
			
			resStr = sb.toString();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resStr;
	}
	
	public static boolean isEqualSHA256(String plainText, String salt, String encryptedText) {
		if(plainText != null && plainText != "") {
			return encryptSHA256(plainText).equals(encryptedText);
		}else {
			return false;
		}
	}
	
}
