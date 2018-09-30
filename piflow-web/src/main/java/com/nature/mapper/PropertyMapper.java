package com.nature.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.nature.component.workFlow.model.Property;

@Mapper
public interface PropertyMapper {

	@Select("select fsp.id, fsp.name, fsp.description from flow_stops_property fsp where fsp.fk_stops_id = #{id}")
	public List<Property> getStopGroupList(String id);

	@Update("update flow_stops_property set name = #{name} where id = #{id}")
	public int updateStops(@Param("name") String content, @Param("id") String id);
}