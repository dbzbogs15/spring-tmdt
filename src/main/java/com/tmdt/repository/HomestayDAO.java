package com.tmdt.repository;

import com.tmdt.model.Homestay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HomestayDAO extends JpaRepository<Homestay, Integer> {
}
