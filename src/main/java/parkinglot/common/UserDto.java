package parkinglot.common;

public class UserDto {
    Long id;
    String username;
    String password;
    String email;

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public UserDto(String username, Long id, String password, String email) {
        this.username = username;
        this.id = id;
        this.password = password;
        this.email = email;
    }
}
