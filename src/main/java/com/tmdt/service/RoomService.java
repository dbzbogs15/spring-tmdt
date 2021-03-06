package com.tmdt.service;

import com.tmdt.model.Room;
import com.tmdt.repository.RoomDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomService {
    @Autowired
    RoomDAO roomDAO;

    public List<Room> findAll() {
        return roomDAO.getAll();
    }
    public Room getOne(int id) { return roomDAO.getOne(id); }
    public List<Room> getRoomByHomestay(int id) {
        return roomDAO.getRoomByHomestay_id(id);
    }
    public Room updateRoom(Room room) {
        return roomDAO.save(room);
    }
}
