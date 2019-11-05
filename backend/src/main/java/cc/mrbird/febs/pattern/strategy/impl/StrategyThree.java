package cc.mrbird.febs.pattern.strategy.impl;

import cc.mrbird.febs.pattern.strategy.Strategy;
import org.springframework.stereotype.Component;

@Component("three")
public class StrategyThree implements Strategy {

    @Override
    public String doOperation() {
        return "three";
    }
}
