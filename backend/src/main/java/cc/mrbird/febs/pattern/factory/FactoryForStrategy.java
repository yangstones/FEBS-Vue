package cc.mrbird.febs.pattern.factory;

import cc.mrbird.febs.pattern.strategy.Strategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class FactoryForStrategy {

    @Autowired
    Map<String, Strategy> strategies = new ConcurrentHashMap<>(3);

    public Strategy getStrategy(String strategyName) {
        Strategy strategy = strategies.get(strategyName);
        if (strategy == null) {
            throw new RuntimeException("no strategy defined");
        }
        return strategy;
    }
}
