package diplom.shop.model;

import diplom.shop.enumm.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Data
@Entity
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "\"user\"")
public class User implements UserDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "First name must be not empty.")
    @NotNull(message = "First name should not be empty.")
    @Size(min = 2, max = 30, message = "First name size should be between 2 and 30.")
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @NotEmpty(message = "Last name must be not empty.")
    @NotNull(message = "Last name should not be empty.")
    @Size(min = 2, max = 30, message = "Last name size should be between 2 and 30.")
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Email(message = "Email should be valid.")
    @Size(min = 0, message = "Mail must be not empty.")
    @NotNull(message = "Email should not be empty.")
    @NotEmpty(message = "Mail must be not empty.")
    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @NotEmpty(message = "Password must be not empty.")
    @NotNull(message = "Password should not be empty.")
    @Column(name = "password", nullable = false)
    @Size(min = 5, message = "Password size must be more than 5")
    private String password;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Computer> computers = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    private UserRole role;

    @Column(name = "active", nullable = false)
    private boolean active;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.name());
        return Collections.singleton(authority);
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
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
        return active;
    }
}
