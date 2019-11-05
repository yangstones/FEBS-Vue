package cc.mrbird.febs.pattern.strategy.impl;

import cc.mrbird.febs.pattern.strategy.Strategy;
import org.springframework.stereotype.Component;

@Component("one")
public class StrategyOne implements Strategy {

    @Override
    public String doOperation() {
        return "one";
    }

}
