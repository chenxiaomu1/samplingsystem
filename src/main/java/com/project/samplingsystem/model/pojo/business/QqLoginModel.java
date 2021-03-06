package com.project.samplingsystem.model.pojo.business;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * created by Wuwenbin on 2019/1/2 at 16:57
 *
 * @author wuwenbin
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QqLoginModel implements Serializable {

    private String callbackDomain;
    private String code;


}
