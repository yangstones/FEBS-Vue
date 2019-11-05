package cc.mrbird.febs.common.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Data
public class ShiroProperties {

    private String anonUrl;

    /**
     * token默认有效时间 1天
     */
    private Long jwtTimeOut = 86400L;
}
