package cc.mrbird.febs.pattern.controller;

import cc.mrbird.febs.pattern.factory.FactoryForStrategy;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StrategyController {

    @Autowired
    FactoryForStrategy factoryForStrategy;

    @PostMapping("/strategy")
    @ResponseBody
    public String strategy(@RequestParam("key") String key) {
        String result;
        try {
            result = factoryForStrategy.getStrategy("key").doOperation();
        } catch (Exception e) {
            result = e.getMessage();
        }
        return result;
    }
}
