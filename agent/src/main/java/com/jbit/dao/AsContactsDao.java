package com.jbit.dao;

import com.jbit.entity.AsContacts;

import java.util.List;

public interface AsContactsDao {
   List<AsContacts> findListByCustOmId(Integer customerId);
}