package com.customterrarium.models;

import java.util.Arrays;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@NoArgsConstructor
@Entity
@Table(name = "users")
@Data
public class User implements UserDetails {

    private static final long serialVersionUID = 1l;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

   @NotBlank(message="Please enter a username")
    @Size(min=2, message = "Username must be at least 2 characters long")
    private String username;

   @NotBlank(message="Please enter a password")
   /*Commented out for my convenience
   @Pattern(
           regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$",
           message =
                   "- at least 8 characters\n"
                           + "- must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number\n"
                           + "- Can contain special characters")*/
    @Size(min=4, message = "Password must be at least 4 characters long")
    private String password;

    @Transient
    private String confirmPassword;

    @NotBlank(message = "Please enter a valid email")
    @Email
    private String email;

    @Column(name = "phoneNumber")
    @Size(min=6, message = "Phone number must be at least 6 characters long")
    private String phoneNumber;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
    
}