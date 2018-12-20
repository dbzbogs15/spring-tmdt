package com.tmdt.repository;

import com.tmdt.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomDAO extends JpaRepository<Room, Integer> {

    @Query("select r from Room r where r.homestay_id =:homestay_id")
    List<Room> getRoomByHomestay_id(int homestay_id);
}
