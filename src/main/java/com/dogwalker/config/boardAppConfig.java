package com.dogwalker.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.dogwalker.dao.BoardfreeDao;
import com.dogwalker.dao.BoardfreeDaoImp;

@Configuration
public class boardAppConfig {
	@Bean
    public BoardfreeDao boardfreeDao() {
        return new BoardfreeDaoImp();
    }


}
