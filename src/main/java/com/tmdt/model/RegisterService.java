package com.tmdt.model;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "reg_service")
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class RegisterService {
    @Id
    @GeneratedValue
    private int reg_id;
    private int homestay_id;
    private int service_id;
    @Temporal(TemporalType.DATE)
    private Date date_started;
    @Temporal(TemporalType.DATE)
    private Date date_finished;
}
