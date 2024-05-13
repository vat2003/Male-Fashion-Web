package com.asm1.demo01.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = "orders")
@Table(name = "users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer userID;

    @NotBlank(message = "Please enter your email")
    @Email(message = "Invalid email")
    String email; // cũng là username

    @NotBlank(message = "Please enter your password")
//	@Pattern(regexp = "^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+\\[\\]{}|;:'<>,.?/]).{8,}$", message = "Password must have more than 8 characters, contain lowercase - uppercase letters, numbers, special characters")
	String passwords;

    @NotBlank(message = "Please enter your fullname")
    String fullname;

    Boolean role = false;

    @NotBlank(message = "Please enter your address")
    String address;

    @Temporal(TemporalType.DATE)
    Date birthday ;

//    @NotBlank(message = "Please enter your phoneNum")
    @Size(min = 10, max = 15, message = "Phone number must be 10 to 15 characters")
    String phoneNum;
    
    
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Order> orders;


}
