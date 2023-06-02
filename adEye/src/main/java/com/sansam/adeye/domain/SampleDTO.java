package com.sansam.adeye.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 도메인은 객체 생성시 만들어준다.
@Data //  Getter/Setter, equals(), hashCode(), toString()  를 생성해줌
@AllArgsConstructor
@NoArgsConstructor
public class SampleDTO {
	private String name;
	private int age;
}
