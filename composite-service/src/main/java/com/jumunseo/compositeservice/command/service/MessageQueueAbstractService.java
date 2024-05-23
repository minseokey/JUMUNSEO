package com.jumunseo.compositeservice.command.service;

import com.jumunseo.compositeservice.command.dto.CommandDto;
import jakarta.servlet.http.HttpServletRequest;

public interface MessageQueueAbstractService {
    public void send(String topic, CommandDto data);
    public CommandDto setMessage(HttpServletRequest request, CommandDto data, String body, String command);
}
