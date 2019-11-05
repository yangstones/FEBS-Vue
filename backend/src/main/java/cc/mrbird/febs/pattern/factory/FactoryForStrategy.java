package cc.mrbird.febs.pattern.factory;

import cc.mrbird.febs.pattern.strategy.Strategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class FactoryForStrategy {

    @Autowired
    Map<String, Strategy> strategys = new ConcurrentHashMap<>(3);

    public Strategy getStrategy(String compoment) throws Exception {
        Strategy strategy = strategys.get(compoment);
        if (strategy != null) {
            throw new RuntimeException("no trategy defined");
        }
        return strategy;
    }
}
