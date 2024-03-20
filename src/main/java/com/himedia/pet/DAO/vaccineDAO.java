package com.himedia.pet.DAO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface vaccineDAO {

   int petadd(String num, String name, String birth);


}
