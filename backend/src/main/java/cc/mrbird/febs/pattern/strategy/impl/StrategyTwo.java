package cc.mrbird.febs.pattern.strategy.impl;

import cc.mrbird.febs.pattern.strategy.Strategy;
import org.springframework.stereotype.Component;

@Component("two")
public class StrategyTwo implements Strategy {

    @Override
    public String doOperation() {
        return "two";
    }
}
