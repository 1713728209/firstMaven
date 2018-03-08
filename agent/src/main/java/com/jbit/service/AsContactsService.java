package com.jbit.service;

import com.jbit.entity.AsContacts;

import java.util.List;

public interface AsContactsService {
    List<AsContacts> findListByCustOmId(Integer customerId);
}
