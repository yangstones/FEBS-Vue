package cc.mrbird.febs.common.properties;

import lombok.Data;

@Data
public class ShiroProperties {

    private String anonUrl;

    /**
     * token默认有效时间 1天
     */
    private Long jwtTimeOut = 86400L;
}
