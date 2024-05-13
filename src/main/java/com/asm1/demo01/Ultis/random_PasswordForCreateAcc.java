package com.asm1.demo01.Ultis;

import java.security.SecureRandom;
import java.util.regex.*;
public class random_PasswordForCreateAcc {
		public   String UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    public   String LOWER = "abcdefghijklmnopqrstuvwxyz";
	    public   String DIGITS = "0123456789";
	    public   String SPECIAL = "!@#$%^&*()_+[]{}|;:'<>,.?/";

	    public  String getRandomPass() {
	        SecureRandom random = new SecureRandom();
	        StringBuilder result = new StringBuilder(8);

	        // Chọn ít nhất một chữ hoa, một chữ thường, một chữ số và một ký tự đặc biệt
	        result.append(UPPER.charAt(random.nextInt(UPPER.length())));
	        result.append(LOWER.charAt(random.nextInt(LOWER.length())));
	        result.append(DIGITS.charAt(random.nextInt(DIGITS.length())));
	        result.append(SPECIAL.charAt(random.nextInt(SPECIAL.length())));

	        // Thêm 4 ký tự ngẫu nhiên khác
	        String allCharacters = UPPER + LOWER + DIGITS + SPECIAL;
	        for (int i = 0; i < 4; i++) {
	            result.append(allCharacters.charAt(random.nextInt(allCharacters.length())));
	        }

	        // Trộn chuỗi ngẫu nhiên
	        String randomized = randomizeString(result.toString());

	        return randomized;
	    }

	    public  String randomizeString(String input) {
	        char[] characters = input.toCharArray();
	        SecureRandom random = new SecureRandom();
	        for (int i = characters.length - 1; i > 0; i--) {
	            int index = random.nextInt(i + 1);
	            char temp = characters[i];
	            characters[i] = characters[index];
	            characters[index] = temp;
	        }
	        return new String(characters);
	    }

	    
	    public boolean isPasswordValid(String password) {
	        if (password.length() <= 8) {
	            return false;
	        }
	        
	        // Kiểm tra xem chuỗi có ít nhất một chữ số
	        if (!Pattern.compile("[0-9]").matcher(password).find()) {
	            return false;
	        }
	        
	        // Kiểm tra xem chuỗi có ít nhất một chữ hoa
	        if (!Pattern.compile("[A-Z]").matcher(password).find()) {
	            return false;
	        }
	        
	        // Kiểm tra xem chuỗi có ít nhất một chữ thường
	        if (!Pattern.compile("[a-z]").matcher(password).find()) {
	            return false;
	        }
	        
	        // Kiểm tra xem chuỗi có ít nhất một ký tự đặc biệt
	        if (!Pattern.compile("[!@#$%^&*()_+\\[\\]{}|;:'<>,.?/]").matcher(password).find()) {
	            return false;
	        }
	        
	        // Nếu tất cả điều kiện đều đúng, trả về true
	        return true;
	    }   
	   
}
