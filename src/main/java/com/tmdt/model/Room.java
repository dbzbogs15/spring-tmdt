package com.tmdt.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "room")
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int room_id;
    private String room_name;
    private int room_status;
    private int room_number_guest;
    private int room_reviews;
    private int room_number_reviews;
    private String room_address;
    private int room_price;
    private String room_describe;
    private String room_information;
    private int room_type;
    private int homestay_id;
    private String room_image;
//    @Column(name="isDeleted")
    private int room_del;

    @OneToOne
    @JoinColumn(name = "homestay_id", insertable = false, updatable = false)
    private Homestay homestay;
}
