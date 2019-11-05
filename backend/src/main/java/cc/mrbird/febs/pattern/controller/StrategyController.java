package cc.mrbird.febs.pattern.controller;

import cc.mrbird.febs.pattern.factory.FactoryForStrategy;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Api("策略相关接口文档")
public class StrategyController {

    @Autowired
    FactoryForStrategy factoryForStrategy;

    @ApiOperation(value="根据指定的策略执行相应的操作", notes="根据策略名称执行策略操作")
    @ApiImplicitParam(name="strategyName", value = "策略名称", required = true, dataType = "String", paramType = "query")
    @PostMapping("/strategy")
    @ResponseBody
    public String strategy(@RequestParam("strategyName") String strategyName) {
        String result;
        try {
            result = factoryForStrategy.getStrategy(strategyName).doOperation();
        } catch (Exception e) {
            result = e.getMessage();
        }
        return result;
    }
}
