package com.itwillbs.test.service;


import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.StoredashMapper;

@Service
public class StoredashService {
    private StoredashMapper storedashMapper;

    public StoredashService(StoredashMapper storedashMapper) {
        this.storedashMapper = storedashMapper;
    }

    public int getTodayReservationCounts(String cId) {
        return storedashMapper.getTodayReservationCounts(cId);
    }

    public int getMonthlyReservationCounts(String cId) {
        return storedashMapper.getMonthlyReservationCounts(cId);
    }

    public int getTodaySalesAmount(String cId) {
        return storedashMapper.getTodaySalesAmount(cId);
    }

    public int getWeeklyallSalesAmount(String cId) {
        return storedashMapper.getWeeklyallSalesAmount(cId);
    }
}

