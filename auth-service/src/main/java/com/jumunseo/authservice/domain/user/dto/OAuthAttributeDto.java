package com.jumunseo.authservice.domain.user.dto;

import com.jumunseo.authservice.domain.user.entity.LoginType;
import com.jumunseo.authservice.domain.user.entity.Role;
import com.jumunseo.authservice.domain.user.entity.User;
import lombok.*;

import java.util.Map;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OAuthAttributeDto {
    private Map<String, Object> attributes;
    private String name;
    private String email;
    private String nameAttributeKey;
    private LoginType loginType;

    public OAuthAttributeDto(Map<String, Object> attributes, String nameAttributeKey, String name, String email){
        this.attributes = attributes;
        this.name = name;
        this.email = email;
        this.nameAttributeKey = nameAttributeKey;
    }

    public static OAuthAttributeDto of(String registrationId, String userNameAttributeName, Map<String, Object> attributes){
        if ("google".equals(registrationId)) {
            return ofGoogle(userNameAttributeName, attributes);
        }
//        return ofApple(userNameAttributeName, attributes);
        return null;
    }

    private static OAuthAttributeDto ofGoogle(String userNameAttributeName, Map<String, Object> attributes){
        return OAuthAttributeDto.builder()
                .name((String) attributes.get("name"))
                .email((String) attributes.get("email"))
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .loginType(LoginType.GOOGLE)
                .build();
    }

//    private static OAuthAttributeDto ofApple(String userNameAttributeName, Map<String, Object> attributes){
//        return OAuthAttributeDto.builder()
//                .name((String) attributes.get("name"))
//                .email((String) attributes.get("email"))
//                .attributes(attributes)
//                .nameAttributeKey(userNameAttributeName)
//                .loginType(LoginType.APPLE)
//                .build();
//    }
    public User toEntity(OAuthAttributeDto oAuthAttributeDto){
        return User.builder().
                email(oAuthAttributeDto.getEmail()).
                name(oAuthAttributeDto.getName()).
                loginType(oAuthAttributeDto.getLoginType()).
                role(Role.USER).
                password("").
                build();
    }
}
