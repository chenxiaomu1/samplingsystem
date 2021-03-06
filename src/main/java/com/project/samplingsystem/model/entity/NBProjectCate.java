package com.project.samplingsystem.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

/**
 * created by Wuwenbin on 2018/12/18 at 23:09
 * @author wuwenbin
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "nb_project_cate")
@Entity
@Builder
public class NBProjectCate implements Serializable {

    /**
     * 主键id
     * 自增长生成策略
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(updatable = false, nullable = false, length = 11)
    private Long id;

    @Column(length = 50, nullable = false)
    @NotEmpty
    private String name;

    @Column(length = 50)
    @NotEmpty
    private String cnName;

}
