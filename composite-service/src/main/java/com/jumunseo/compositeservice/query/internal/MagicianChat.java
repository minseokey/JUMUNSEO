package com.jumunseo.compositeservice.query.internal;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Map;
import java.util.List;

@NoArgsConstructor
@Setter
@Getter
public class MagicianChat {
    String room_id;
    String start_time;
    String user_id;
    String added_prompt;
    List<Map<String,String>> conversation;
}
